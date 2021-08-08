unit uEnvioEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ImgList, wwdblook, Db, Inifiles;

type
  TfrmEnvioEmail = class(TForm)
    ImageList: TImageList;
    Bevel1: TBevel;
    cbEndereco: TwwDBLookupCombo;
    Label2: TLabel;
    Label4: TLabel;
    edArquivo: TEdit;
    dsEndereco: TDataSource;
    procedure btCancelarClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbEnderecoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioEmail: TfrmEnvioEmail;

implementation

uses uFuncoesMail, dataDados, uFuncoesDB;

{$R *.DFM}

procedure TfrmEnvioEmail.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEnvioEmail.btEnviarClick(Sender: TObject);
var
mail: TStringList;
vCorpo: String;
vAnexo: String;
vEndEmail: String;
begin
  vEndEmail := cbEndereco.Text;
  //verifica se endereço digitado já existe na tabela de emails
  dmDados.qyEmails.Close;
  dmDados.qyEmails.SQL.Clear;
  dmDados.qyEmails.SQL.Add('select ema_id, ema_endereco from emails where ema_endereco = ');
  dmDados.qyEmails.SQL.Add(QuotedStr(cbEndereco.Text));
  dmDados.qyEmails.Open;
  if dmDados.qyEmailsema_endereco.IsNull then
  Begin
    dmDados.qyEmails.Append;
    dmDados.qyEmailsema_id.Value := GetCodigo('ema_id', 'emails');
    dmDados.qyEmailsema_endereco.Text := vEndEmail;
    dmDados.qyEmails.Post;
  end;
  vAnexo := edArquivo.Text;
  mail := TStringList.Create;
  try
    //AQUI VAI O EMAIL DO DESTINATARIO
    mail.values['to'] := vEndEmail;
    //AQUI O ASSUNTO
    mail.values['subject'] := 'Tiss - XML Gerado';
    //AQUI O TEXTO NO CORPO DO EMAIL
    mail.values['body'] := 'Segue em anexo Tiss - XML Gerado';
    //AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS
    mail.values['attachment0'] := vAnexo;
    //mail.values['attachment1'] := 'C:\Test2.txt';
    //IDEM  - NO ATTACHMENT1 TEM QUE COLOCAR A SEQUNCIA DO EMAIL A QUAL DESEJA ENVIAR EXEMPLO: ATTACHMENT1
    SendEMail(Application.Handle, mail);
  finally
    mail.Free;
    Close;
  end;
end;

procedure TfrmEnvioEmail.FormActivate(Sender: TObject);
begin
  //btEnviar.Enabled := false;
  dsEndereco.DataSet.Active := true;
end;

procedure TfrmEnvioEmail.cbEnderecoChange(Sender: TObject);
begin
  if cbEndereco.Text = '' then
    //btEnviar.Enabled := false
  else
    //btEnviar.Enabled := true;
end;

end.
