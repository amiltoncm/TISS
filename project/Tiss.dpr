program Tiss;

uses
  Forms,
  uPrincipal in '..\view\estrutura\uPrincipal.pas' {frmPrincipal},
  dataTmpConexao in '..\dados\dataTmpConexao.pas' {dmTmpConexao: TDataModule},
  uErConexao in '..\view\mensagens\uErConexao.pas' {frmErConexao},
  dataDados in '..\dados\dataDados.pas' {dmDados: TDataModule},
  uEnvioEmail in '..\view\estrutura\uEnvioEmail.pas' {frmEnvioEmail},
  uXML in '..\view\estrutura\uXML.pas' {frmXML},
  uVarGlobal in '..\var\uVarGlobal.pas',
  uFuncoesSistema in '..\..\source__genesis\funcoes\uFuncoesSistema.pas',
  uFuncoesMail in '..\..\source__genesis\funcoes\uFuncoesMail.pas',
  uFuncoesSeguranca in '..\..\source__genesis\funcoes\uFuncoesSeguranca.pas',
  uFuncoesDB in '..\..\source__genesis\funcoes\uFuncoesDB.pas',
  dataConsultas in '..\..\source__genesis\dados\dataConsultas.pas' {dmConsultas: TDataModule},
  dataLookups in '..\..\source__genesis\dados\dataLookups.pas' {dmLookups: TDataModule},
  uFuncoesFormatacao in '..\..\source__genesis\funcoes\uFuncoesFormatacao.pas',
  uDaoExamesAut in '..\dao\uDaoExamesAut.pas',
  uFuncoesValidacao in '..\..\source__genesis\funcoes\uFuncoesValidacao.pas',
  uFuncoesVersao in '..\..\source__genesis\funcoes\uFuncoesVersao.pas',
  dataConfig in '..\..\source__genesis\dados\dataConfig.pas' {dmConfig: TDataModule},
  uDaoEmpresa in '..\..\source__genesis\dao\uDaoEmpresa.pas',
  uDaoConfig in '..\..\source__genesis\dao\uDaoConfig.pas',
  uFuncoesWeb in '..\..\source__genesis\funcoes\uFuncoesWeb.pas',
  uDaoModulos in '..\..\source__genesis\dao\uDaoModulos.pas',
  uDaoExamesTISS in '..\dao\uDaoExamesTISS.pas',
  uDaoExamesCob in '..\dao\uDaoExamesCob.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TISS';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmErConexao, frmErConexao);
  Application.CreateForm(TdmTmpConexao, dmTmpConexao);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmEnvioEmail, frmEnvioEmail);
  Application.CreateForm(TfrmXML, frmXML);
  Application.CreateForm(TdmConsultas, dmConsultas);
  Application.CreateForm(TdmLookups, dmLookups);
  Application.CreateForm(TdmConfig, dmConfig);
  Application.Run;
end.
