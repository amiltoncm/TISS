unit uDaoExamesTISS;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, StdCtrls, Forms,
  Graphics, Controls, DB;

//procedure SetValuesExamesTISS;
procedure InsExamesTISS;
procedure EdtExamesTISS;
procedure PostExamesTISS;
procedure ListarExamesTISS(vfOrdem: String; vfLimite: String);
procedure FiltrarExamesTISS(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String; vfLimite: String);

const
ctCampos = 'exa_id, tis_tipoatend';
ctTabelas = 'examestiss';

implementation

uses dataDados;

{--- Seta algum valor na tabela -----------------------------------------------}

{
procedure SetValuesExamesTISS(vfDAO: TDAO);
begin
  //
end;
}

{--- Coloca a tabela em insert  -----------------------------------------------}

procedure InsExamesTISS;
begin
  if dmDados.qyExamesTISS.Active = false then
    dmDados.qyExamesTISS.Active := true;
  dmDados.qyExamesTISS.Insert;
  dmDados.qyExamesTISStis_tipoatend.Value := 5;
end;

{--- Coloca a tabela em edit inserindo algum valor ----------------------------}

procedure EdtExamesTISS;
begin
  dmDados.qyExamesTISS.Edit;
end;

{--- Dá um post na tabela -----------------------------------------------------}

procedure PostExamesTISS;
begin
  try
    dmDados.qyExamesTISS.Post;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gravar Alteração / Inserção!' + #13 +
          E.Message,mtError,[mbOk],0);
      dmDados.qyExamesTISS.Refresh;
    end;
  end;
end;

{--- Lista todos os registros da tabela ---------------------------------------}

procedure ListarExamesTISS(vfOrdem: String; vfLimite: String);
begin
  dmDados.qyExamesTISS.Close;
  dmDados.qyExamesTISS.SQL.Clear;
  dmDados.qyExamesTISS.SQL.Add('select '+ ctCampos + ' from ' + ctTabelas);
  if vfOrdem <> '0' then
    dmDados.qyExamesTISS.SQL.Add(' order by ' + vfOrdem);
  if vfLimite <> '0' then
    dmDados.qyExamesTISS.SQL.Add(' limit ' + vfLimite);
  dmDados.qyExamesTISS.Open;
end;

{--- Filtra registros da tabela -----------------------------------------------}

procedure FiltrarExamesTISS(vfCampoFil: String; vfOperador: String; vfParametro: 
		     String; vfOrdem: String; vfLimite: String);
begin
  dmDados.qyExamesTISS.Close;
  dmDados.qyExamesTISS.SQL.Clear;
  dmDados.qyExamesTISS.SQL.Add('select ' + ctCampos + ' from ' + ctTabelas + ' where ');
  dmDados.qyExamesTISS.SQL.Add(vfCampoFil + ' ' + vfOperador + ' ');
  dmDados.qyExamesTISS.SQL.Add(QuotedStr(vfParametro));
  if vfOrdem <> '0' then
    dmDados.qyExamesTISS.SQL.Add(' order by ' + vfOrdem);
  if vfLimite <> '0' then
    dmDados.qyExamesTISS.SQL.Add(' limit ' + vfLimite);
  dmDados.qyExamesTISS.Open;
end;

end.
