unit dataTmpConexao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Inifiles, DBTables, SDEngine;


type
  TdmTmpConexao = class(TDataModule)
    database: TSDDatabase;
    QGeraCodigo: TSDQuery;
    QTemp: TSDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure databaseBeforeDisconnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTmpConexao: TdmTmpConexao;

implementation

uses uPrincipal, uErConexao, uVarGlobal, uFuncoesSistema, uFuncoesSeguranca;

{$R *.dfm}

procedure TdmTmpConexao.databaseBeforeDisconnect(Sender: TObject);
begin
  if database.InTransaction then
    database.Commit;
end;

procedure TdmTmpConexao.DataModuleCreate(Sender: TObject);
Var
vControl: Tinifile;
vServer, vHost, vUser, vPassword, vDialect: String;
vServerType: String;
vWindowsIni: String;
Begin
  database.Close;
  database.Params.Clear;
  vgPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  vgArqIni := vgPath + '\genesis.ini';
  if Not FileExists(vgArqIni) then
  Begin
    Messagedlg('Arquivo genesis.ini não encontrado!' + #13 + #10 + 'Execute o Config para gerá-lo!',mtError,[mbok],0);
    Application.Terminate;
  end;
  vWindowsIni := vgPath + '\windows.ini';
  vControl := Tinifile.create(vgArqIni);
  vHost := vControl.readstring('Base', 'Base','');
  vServerType := vControl.readstring('Base', 'ServerType', '');
  vgDirTemp := vControl.ReadString('Temp', 'Diretorio', '');
  vgDirBase := vControl.ReadString('Tiss', 'Diretorio', '');
  vServer := vControl.readstring('Base', 'Servidor','');
  vUser := vControl.readstring('Base', 'User','');
  vPassword := vControl.readstring('Base', 'Password','');
  vPassword := DecryptMsg((vPassword), Length(vPassword));
  //Carrega compactadores
  vgInstWinrar := vControl.ReadString('compactadores', 'winrar', '');
  vgInstWinZip := vControl.ReadString('compactadores', 'winzip', '');
  if vServerType = 'INTERBASE' then
    vDialect := vControl.readstring('Interbase','Dialect','');
  if vServerType = 'FIREBIRD' then
    vDialect := vControl.readstring('Firebird','Dialect','');
  Try
    database.RemoteDatabase := vServer + ':' + vHost;
    vControl.Free;
    database.Params.Add('USER NAME=' + vUser);
    database.Params.Add('PASSWORD=' + vPassword);
    //se o tipo do Banco for Interbase adiciona o SQL Dialect
    if vServerType = 'INTERBASE' then
      database.Params.Add('SQL Dialect='+vDialect);
    if vServerType = 'FIREBIRD' then
      database.Params.Add('SQL Dialect='+vDialect);
    database.Connected := True;
    //Sessao.Active := True;
  except
    on E: Exception do
    Begin
      frmErConexao.memLogErro.Lines.Clear;
      frmErConexao.memLogErro.Lines.Add(E.Message);
      frmErConexao.Showmodal;
    end;
  end;
end;

end.
