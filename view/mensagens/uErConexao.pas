unit uErConexao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, Inifiles;

type
  TfrmErConexao = class(TForm)
    BitBtn1: TBitBtn;
    memLogErro: TMemo;
    Image1: TImage;
    Image2: TImage;
    memMsgErro: TMemo;
    Label1: TLabel;
    lbMail: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbMailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErConexao: TfrmErConexao;

implementation

uses uFuncoesSistema, uFuncoesMail;

{$R *.DFM}

procedure TfrmErConexao.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmErConexao.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
vArq: TextFile;
vPath, vArqIni: String;
vLocErr, vErrorLog: String;
vControl: TInifile;
begin
  vPath := DiretorioSemBarra(ExtractFileDir(Application.exename));
  vArqIni := vPath + '\' + RetornaExecutavelSemExtensao + '.ini';
  vControl := TInifile.create(vArqIni);
  vLocErr := vControl.readstring('Logs', 'Erro', '');
  AssignFile(vArq, vLocErr);
  if not FileExists(vLocErr) then
    ReWrite(vArq);
  vErrorLog := 'Erro de conexão!' + ' - ' + DateToStr(now) + ' - ' + TimeToStr(now) + #13;
  Append(vArq);
  WriteLn(vArq, vErrorLog);
  CloseFile(vArq);
  vControl.Free;
  Application.Terminate;
end;

procedure TfrmErConexao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TfrmErConexao.lbMailClick(Sender: TObject);
Var
vPath, vLogError, vLocErr: String;
vArq: TextFile;
vDirTemp, vAnexo, vAttachmentNum, vEndMail: String;
vControl: TInifile;
vI: integer;
vMail: TStringList;
begin
  //Cria log com erro
  vPath := DiretorioSemBarra(ExtractFileDir(Application.exename));
  vLocErr := vPath + '\Erro.log';
  AssignFile(vArq, vLocErr);
  if FileExists (vLocErr) then
    DeleteFile(vLocErr);
  if not FileExists(vLocErr) then
    ReWrite(vArq);
  vLogError := memLogErro.Text;
  Append(vArq);
  WriteLn(vArq, vLogError);
  CloseFile(vArq);
  vAnexo := vLocErr;
  //Falta implementar e-mail dinâmico do suporte - INI
  vEndMail := 'suporte@nextinf.com';
  //inicia procedimento de envio de e-mail
  vMail := TStringList.Create;
  //AQUI VAI O EMAIL DO DESTINATARIO
  vMail.values['to'] := vEndMail;
  //AQUI O ASSUNTO
  vMail.values['subject'] := 'Erro de conexão!';
  //AQUI O TEXTO NO CORPO DO EMAIL
  vMail.values['body'] := memLogErro.Text;
  vAttachmentNum := 'attachment0';
  vMail.values[vAttachmentNum] := vAnexo;
  //conclui o procedimento de envio de e-mail
  SendEMail(Application.Handle, vMail);
  vMail.Free;
end;

end.
