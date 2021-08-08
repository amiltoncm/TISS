unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TissSP_SADT, ComCtrls, Inifiles, wwdblook, DB,
  Mask, DBCtrls, Gauges, ShellApi, SHDocVw, xmldom, XMLIntf, Menus,
  msxmldom, XMLDoc, ExtCtrls, OleCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    btGerar: TBitBtn;
    Label1: TLabel;
    cbCobranca: TwwDBLookupCombo;
    Label2: TLabel;
    dsConvenios: TDataSource;
    dsReceber: TDataSource;
    dsEmpresa: TDataSource;
    dsTiss: TDataSource;
    dsMedicos: TDataSource;
    dbID: TDBEdit;
    dbCliente: TDBEdit;
    dbValor: TDBEdit;
    cbRefazer: TCheckBox;
    Gauge: TGauge;
    SaveDialog1: TSaveDialog;
    PageControl1: TPageControl;
    tsStatus: TTabSheet;
    reXML: TMemo;
    Panel1: TPanel;
    Label3: TLabel;
    cbCodificacao: TComboBox;
    Label5: TLabel;
    cbCompactador: TComboBox;
    cbZerado: TCheckBox;
    Label4: TLabel;
    cbTipoDoc: TComboBox;
    lbCodigo: TLabel;
    edCodigo: TMaskEdit;
    Label6: TLabel;
    tsTreeView: TTabSheet;
    XMLDocument1: TXMLDocument;
    TreeView1: TTreeView;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    Expandirtodos1: TMenuItem;
    Recolhertodos1: TMenuItem;
    cbConvenio: TwwDBLookupCombo;
    btFechar: TBitBtn;
    pnUltArq: TPanel;
    lbArqGer: TLabel;
    cbVersao: TComboBox;
    btAbrir: TBitBtn;
    OpenDialog1: TOpenDialog;
    TissSP: TTissSP_SADT;
    Label8: TLabel;
    cbEquipe: TComboBox;
    edGrauPart: TEdit;
    Label9: TLabel;
    dbHisID: TDBEdit;
    tsExames: TTabSheet;
    dsExamesCob: TDataSource;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    cbAcidente: TComboBox;
    procedure AdicionaNo(NoXML: IXMLNode; Pai : TTreeNode);
    procedure LerArquivo(Nome: TFileName);
    procedure FiltraRec;
    procedure btGerarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbConvenioExit(Sender: TObject);
    procedure cbRefazerClick(Sender: TObject);
    procedure cbConvenioKeyPress(Sender: TObject; var Key: Char);
    procedure cbCobrancaEnter(Sender: TObject);
    procedure cbTipoDocChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Expandirtodos1Click(Sender: TObject);
    procedure Recolhertodos1Click(Sender: TObject);
    procedure lbArqGerClick(Sender: TObject);
    procedure btAbrirClick(Sender: TObject);
    procedure cbVersaoChange(Sender: TObject);

  private

    ComponentePro: TComponent;
    procedure ProCode(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untTissComp, dataDados, uEnvioEmail, md52, uVarGlobal,
  uFuncoesDB, uXML, uDaoExamesAut, uFuncoesFormatacao, uFuncoesSistema,
  uFuncoesValidacao, uFuncoesVersao, uDaoExamesTISS, uDaoExamesCob;

{$R *.dfm}

procedure TfrmPrincipal.AdicionaNo(NoXML: IXMLNode; Pai : TTreeNode);
var
SubNoXML : IXMLNode;
Filho : TTreeNode;
i : integer;
begin
  Filho := TreeView1.Items.AddChild(Pai, NoXML.NodeName);
  for i := 0 to NoXML.AttributeNodes.Count-1 do
    Filho.Text := Filho.Text + ' ' +
  NoXML.AttributeNodes.Get(i).NodeName + '=' + QuotedStr(NoXML.AttributeNodes.Get(i).Text);
  if NoXML.HasChildNodes then
  begin
    for i := 0 to NoXML.ChildNodes.Count - 1 do
    begin
      case NoXML.ChildNodes[i].NodeType of
        ntText : TreeView1.Items.AddChild(Filho, NoXML.Text);
      else
        SubNoXML := NoXML.ChildNodes[i];
      AdicionaNo(SubNoXML, Filho);
    end;
  end;
end;

end;

procedure TfrmPrincipal.LerArquivo(Nome: TFileName);
begin
  Screen.Cursor := crHourGlass;
  try
    XMLDocument1.LoadFromFile(Nome);
    XMLDocument1.Active := true;
    TreeView1.Items.Clear;
    AdicionaNo(XMLDocument1.DocumentElement, nil);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipal.PageControl1Change(Sender: TObject);
Var
vArqTemp: String;
begin
  if PageControl1.ActivePage = tsTreeView then
  begin
    vArqTemp := 'c:\genesis\temp\guias.xml';
    reXML.Lines.SaveToFile(vArqTemp);
    Screen.Cursor := crHourGlass;
    try
      XMLDocument1.LoadFromFile(vArqTemp);
      XMLDocument1.Active := true;
      TreeView1.Items.Clear;
      AdicionaNo(XMLDocument1.DocumentElement, nil);
      Screen.Cursor := crDefault;
    except
      MessageDlg('Não foi possível carregar o arquivo!', mtWarning, [mbok], 0);
      Screen.Cursor := crDefault;
    end;
  end;
  if PageControl1.ActivePage = tsExames then
  begin
    if dsReceber.DataSet.FieldByName('his_id').IsNull then
      FiltrarExamesCob('0')
    else
      FiltrarExamesCob(dsReceber.DataSet.FieldByName('his_id').Text);
  end;
end;

procedure TfrmPrincipal.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow; // cor ao sair
  if (ActiveControl is TCustomEdit) or
     (ActiveControl is TComboBox) or
     (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clSkyBlue;  // cor ao focar
    ComponentePro := ActiveControl;
  end;
end;

procedure TfrmPrincipal.Recolhertodos1Click(Sender: TObject);
begin
  TreeView1.FullCollapse;
end;

procedure TfrmPrincipal.FiltraRec;
begin
  cbCobranca.Clear;
  dmDados.qyReceber.Close;
  dmDados.qyReceber.SQL.Clear;
  dmDados.qyReceber.SQL.Add('select r.rec_vencimento, r.rec_codigo, r.rec_nome, r.rec_valor, ');
  dmDados.qyReceber.SQL.Add('r.rec_emissao, r.cov_codigo, r.his_id, r.cob_codigo, r.rec_status, ');
  dmDados.qyReceber.SQL.Add('t.rec_codigo, t.rti_gerado, t.rti_id, t.rti_lote ');
  dmDados.qyReceber.SQL.Add('from receber r, rectiss t ');
  dmDados.qyReceber.SQL.Add('where r.rec_codigo = t.rec_codigo ');
  if cbRefazer.Checked = false then
    dmDados.qyReceber.SQL.Add('and t.rti_gerado = false ');
  dmDados.qyReceber.SQL.Add('and r.rec_status = ');
  dmDados.qyReceber.SQL.Add(QuotedStr('A'));
  dmDados.qyReceber.SQL.Add(' and r.cov_codigo = ');
  dmDados.qyReceber.SQL.Add(QuotedStr(dmDados.lkConvenioscov_codigo.Text));
  dmDados.qyReceber.SQL.Add(' order by r.rec_codigo desc');
  dmDados.qyReceber.Open;
end;

procedure TfrmPrincipal.btGerarClick(Sender: TObject);
Var
vControl: TInifile;
vDiretorio, vArqXSD, vArqGerar, vTestaVersaoTISS: String;
vHisID, vExaID, vCodRegANS, vConvCNPJ, vVersaoPadrao: String;
vTabPadrao, vCont, vContProced, vQuantExames, vQuantProc, vTestaTamDOC: integer;
vVersaoTISS: TTissAnsVersao;
vErros: integer;
vIDExameErro: String;
vTemp, vLinhaComando: String;
vIDResp: String;
vCPFMedico: String;
vIDCob: String;
begin
  try
  dmDados.qyEmpresa.Active := true;
  PageControl1.ActivePage := tsStatus;
  if cbZerado.Checked = true then
  begin
    if MessageDlg('Deseja realmente gerar o TISS com valor zerado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      cbZerado.Checked := True
    else
      cbZerado.Checked := false;
  end;
  reXML.Clear;
  vErros := 0;
  vCont := 0;
  Gauge.Progress := 0;
  Gauge.Visible := true;
  frmPrincipal.Cursor := crHourGlass;
  reXML.Cursor := crHourGlass;

  //carrega configurações do .ini
  vControl := Tinifile.create(vgArqIni);
  vDiretorio := vControl.readstring('Tiss', 'Diretorio', '');
  vArqGerar := vControl.readstring('Tiss', 'ArquivoGerar', '');
  vArqXSD := vControl.readstring('Tiss', 'ArquivoXSD', '');
  vTestaVersaoTISS := vControl.readstring('Tiss', 'ArquivoXSD', '');
  vArqGerar := vDiretorio + '\' + vArqGerar;
  vArqXSD := vDiretorio + '\xsd\' + vArqXSD + '.xsd';
  vControl.Free;
  if not(FileExists(vArqXSD)) then
    MessageDlg('Arquivo XSD ' + vArqXSD + ' não encontrado!', mtWarning, [mbok], 0)
  else
    reXML.Lines.Add('Arquivo XSD: ' + vArqXSD);
  reXML.Lines.Add('Carregado dados do arquivo ini...');

  //Carrega parâmetros TISS
  vTabPadrao := dmDados.qyTisstab_id.Value;

  //Zera variáveis
  vQuantExames := 0;
  vQuantProc := 0;
  vHisID := dmDados.qyReceberhis_id.Text;
  vIDCob := dmDados.qyReceberrec_codigo.Text;
  if not(dmDados.lkConvenioscov_regans.IsNull) then
    vCodRegANS := Trim(dmDados.lkConvenioscov_regans.Text)
  else
    vErros := vErros + 1;
  vConvCNPJ := LimpaDoc(dmDados.lkConvenioscov_cnpj.Text);
  reXML.Lines.Add('Zerado variáveis...');

  //Conta a quantidade de exames
  dmDados.QTemp.Close;
  dmDados.QTemp.SQL.Clear;
  dmDados.QTemp.SQL.Add('select count(his_id) from histrec where his_id = ');
  dmDados.QTemp.SQL.Add(QuotedStr(vHisID));
  dmDados.QTemp.Open;
  if not dmDados.QTemp.Fields[0].IsNull then
    vQuantExames := dmDados.QTemp.Fields[0].Value;
  reXML.Lines.Add('Contabilizado quantidade de exames... Exames: ' + IntToStr(vQuantExames));

  //Filtra tabela de Histórico da cobrança (HistRec)
  dmDados.qyHistRec.Close;
  dmDados.qyHistRec.SQL.Clear;
  dmDados.qyHistRec.SQL.Add('select * from histrec where his_id = ');
  dmDados.qyHistRec.SQL.Add(QuotedStr(vHisID));
  dmDados.qyHistRec.Open;
  dmDados.qyHistRec.First;
  reXML.Lines.Add('Filtrado tabela de histórico de exames...');

  //Filtra tabela de Convênios
  dmDados.qyConvenios.Close;
  dmDados.qyConvenios.SQL.Clear;
  dmDados.qyConvenios.SQL.Add('select * from convenios where cov_codigo = ');
  dmDados.qyConvenios.SQL.Add(QuotedStr(dmDados.lkConvenioscov_codigo.Text));
  dmDados.qyConvenios.Open;
  reXML.Lines.Add('Filtrado tabela de Convênios...');

  //Envia código de prestador na operadora
  if dmDados.qyConvenioscov_codoperadora.IsNull then
    TissSP.TissCodPrestOp := '0'
  else
    TissSP.TissCodPrestOp := dmDados.qyConvenioscov_codoperadora.Text;

  //inicia componente
  TissSP.iniciaSPSADT;
  reXML.Lines.Add('Iniciado componente...');

  //inicio cabecalho
    //opções TISS
    DecimalSeparator := '.';
    TissSP.TissValid.UsarValidacao := true;
    if cbEquipe.ItemIndex = 0 then
      TissSP.Tissconfig.TissProc.TissUsarEquipe := True
    else
      TissSP.Tissconfig.TissProc.TissUsarEquipe := False;
    TissSP.TissProc.TissValorTotalGeral := 0;
    TissSP.Tisscabecalho.TissArquivo := vArqGerar;

    //configura versão do xsd
    TissSP.TissValid.TissXSD := vArqXSD;
    if vTestaVersaoTISS = 'tissV3_03_01' then
      vVersaoTISS := v3_03_01;
    if vTestaVersaoTISS = 'tissV3_03_02' then
      vVersaoTISS := v3_03_02;
    if vTestaVersaoTISS = 'tissV3_03_03' then
      vVersaoTISS := v3_03_03;
    vVersaoPadrao := cbVersao.Text;
    TissSP.ansVersaoXSD := vVersaoTISS;
    reXML.Lines.Add('Versão do TISS: ' + vVersaoPadrao);
    TissSP.Tissconfig.TissCabecalho.TissArqNomeHash := true;
    TissSP.Tisscabecalho.TissEncoding := cbCodificacao.Text;

    //Dados do aplicativo
    TissSP.TissFabricaAplica := 'GENESIS';
    TissSP.TissNomeAplica := 'GENESIS';
    TissSP.TissVersaoAplica := VersaoSistema(0);

    if vVersaoTISS = v3_03_01 then
      TissSP.Tisscabecalho.TissMensagemTissXml := 'xmlns:ansTISS="http://www.ans.gov.br/padroes/tiss/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.ans.gov.br/padroes/tiss/schemas http://www.ans.gov.br/padroes/tiss/schemas/tissV3_03_01.xsd"';
    if vVersaoTISS = v3_03_02 then
      TissSP.Tisscabecalho.TissMensagemTissXml := 'xmlns:ansTISS="http://www.ans.gov.br/padroes/tiss/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.ans.gov.br/padroes/tiss/schemas http://www.ans.gov.br/padroes/tiss/schemas/tissV3_03_02.xsd"';
    if vVersaoTISS = v3_03_03 then
      TissSP.Tisscabecalho.TissMensagemTissXml := 'xmlns:ansTISS="http://www.ans.gov.br/padroes/tiss/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.ans.gov.br/padroes/tiss/schemas http://www.ans.gov.br/padroes/tiss/schemas/tissV3_03_03.xsd"';

    TissSP.Tisscabecalho.TissVersaoXml := '1.0';

    //dados do cabecalho
    TissSP.Tisscabecalho.TissTipoTrans := 'ENVIO_LOTE_GUIAS';
    if not(dmDados.qyTisstiss_sequencial.IsNull) then
      TissSP.Tisscabecalho.TissSequencialTrans := Trim(dmDados.qyTisstiss_sequencial.Text)
    else
      vErros := vErros + 1;
    TissSP.Tisscabecalho.TissDataRegistroTrans := Date;
    TissSP.Tisscabecalho.TissHoraRegistroTrans := Time;
    TissSP.Tisscabecalho.TissCNPJCPF := Trim(LimpaDoc(dmDados.qyEmpresaemp_cnpj.Text));
    TissSP.Tisscabecalho.TissRegANS := Trim(vCodRegANS);
    TissSP.Tisscabecalho.TissVersaoTISS := Trim(vVersaoPadrao);
    TissSP.Tisscabecalho.TissNumLote := Trim(dmDados.qyTisstiss_lote.Text); //ao final atualiza
    TissSP.criaCabecalho;
    //final cabecalho
  reXML.Lines.Add('Cabeçalho iniciado...');

  //Cria guias
  Gauge.MaxValue := vQuantExames;
  for vCont := 1 to vQuantExames do
  begin
    reXML.Lines.Add('-----------------------------------------------------------');
    reXML.Lines.Add('Exame ' + IntToStr(vCont) + ' de ' + IntToStr(vQuantExames) + ' ...');
    reXML.Lines.Add('-----------------------------------------------------------');
    Gauge.Progress := vCont;
    reXML.Lines.Add('Inicializado guia n.° ' + IntToStr(vCont) + '...');
    //filtra a tabela de exammes para pegar dados da requisição
    dmDados.qyExames.Close;
    dmDados.qyExames.SQL.Clear;
    dmDados.qyExames.SQL.Add('select * from exames where exa_id = ');
    dmDados.qyExames.SQL.Add(QuotedStr(dmDados.qyHistRecexa_id.Text));
    dmDados.qyExames.Open;
    //Pega responsavel pelo exame
    vIDResp := dmDados.qyExamesres_codigo.Text;
    //Adiciona ID do exame na hora do erro para verificar qual exame é
    vIDExameErro := dmDados.qyHistRecexa_id.Text;
    //1 - prestadorParaOperadora
      //2 - guiaFaturamento
        //3 - identificacaoGuia
          //4 - identificacaoFontePagadora
            TissSP.TissFontePadora.TissRegAns := Trim(vCodRegANS);
            reXML.Lines.Add('Identificado fonte pagadora guia n.° ' + IntToStr(vCont) + '...');
          //4 - final identificacaoFontePagadora
          TissSP.TissDataEmis := dmDados.qyExamesexa_data.Value;

          if dmDados.qyExamesexa_guia.Text <> '0' then
          begin
            //Guia do prestador
            TissSP.TissNumGuiaPrest := Trim(dmDados.qyExamesexa_guia.Text);

            //Senha de autorização
            FiltrarExamesAut('exa_id', '=', dmDados.qyExamesexa_id.Text, '0', '0');
            if dmDados.qyExamesAutexa_id.IsNull then
              //Guia da operadora
              TissSP.TissNumGuiaOper := Trim(dmDados.qyExamesexa_guia.Text)
            else
            begin
              //Guia da operadora
              TissSP.TissNumGuiaOper := Trim(dmDados.qyExamesAutaut_senha.Text);
              //Senha de autorização
              TissSP.TissSenhaAut := Trim(dmDados.qyExamesAutaut_senha.Text);
              TissSP.TissSenhaValid := dmDados.qyExamesAutaut_data.Value;
            end;
          end
          else
          begin
            reXML.Lines.Add('ERRO - Número de guia inválida guia ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro);
            vErros := vErros + 1;
            MessageDlg('Número de guia inválida guia ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0 );
          end;
          //9 - dadosAutorizacao
            TissSp.TissDataAut := dmDados.qyExamesexa_data.Value;
            reXML.Lines.Add('Finalizado dados da autorização guia n.° ' + IntToStr(vCont) + '...');
          //9 - final dadosAutorizacao
          reXML.Lines.Add('Finalizado identificação guia n.° ' + IntToStr(vCont) + '...');
        //3 - final identificacaoGuia
        //5 - dadosBeneficiario
          if dmDados.qyExamesexa_matricula.Text <> '0' then
            TissSP.TissBeneficiario.TissNumCarteira := Trim(dmDados.qyExamesexa_matricula.Text)
          else
          begin
            reXML.Lines.Add('ERRO - Número da carteira inválida guia ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro);
            vErros := vErros + 1;
            MessageDlg('ERRO - Número da carteira inválida guia ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0 );
          end;
          TissSP.TissBeneficiario.TissBenific := Trim(RemoveAcento(dmDados.qyExamesexa_paciente.Text));
          TissSP.TissBeneficiario.TissNomePlano := 'PLANO 1';
          reXML.Lines.Add('Finalizado dados beneficiário guia n.° ' + IntToStr(vCont) + '...');
        //5 - final dadosBeneficiario
        //6 - dadosSolicitante - MEDICO
          //filtra tabela de medicos
          dmDados.qyMedicos.Close;
          dmDados.qyMedicos.SQL.Clear;
          dmDados.qyMedicos.SQL.Add('select * from medicos where med_codigo = ');
          dmDados.qyMedicos.SQL.Add(QuotedStr(dmDados.qyExamesmed_codigo.Text));
          dmDados.qyMedicos.Open;
          //Contratado - Clínica ou médico contratado
          if dmDados.qyMedicosmed_cpf.Text <> '' then
          begin
            vTestaTamDOC := Length(LimpaDoc(dmDados.qyMedicosmed_cpf.Text));
            vCPFMedico := Trim(dmDados.qyMedicosmed_cpf.Text);
            if vTestaTamDOC = 11 then
            begin
              TissSP.TissContratado.TissTipoGeral := FisicGeral;
              if Cpf(vCPFMedico) = false then
              begin
                reXML.Lines.Add('ERRO - CPF INVÁLIDO DO MÉDICO (' + dmDados.qyMedicosmed_nome.Text + ') guia n.° ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro + '...');
                MessageDlg('CPF inválido do médico da guia: ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0);
                vErros := vErros + 1;
              end;
            end;
            if vTestaTamDOC = 14 then
            begin
              TissSP.TissContratado.TissTipoGeral := JuridicoGeral;
              if Cnpj(vCPFMedico) = false then
              begin
                reXML.Lines.Add('ERRO - CNPJ INVÁLIDO DO MÉDICO (' + dmDados.qyMedicosmed_nome.Text + ') guia n.° ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro + '...');
                MessageDlg('CPF inválido do médico da guia: ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0);
                vErros := vErros + 1;
              end;
            end;
            TissSP.TissContratado.TissCNPJCPF := Trim(LimpaDoc(dmDados.qyMedicosmed_cpf.Text));
          end
          else
          begin
            reXML.Lines.Add('ERRO - CNPJ INVÁLIDO DO MÉDICO guia n.° ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro + '...');
            MessageDlg('CNPJ inválido do médico da guia: ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0);
            vErros := vErros + 1;
          end;
          if dmDados.qyMedicoscbo_codigo.IsNull then
          begin
            reXML.Lines.Add('ERRO - FALTA CBO DO MÉDICO guia n.° ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro + '...');
            MessageDlg('Falta CBO do médico da guia: ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0);
            vErros := vErros + 1;
          end
          else
            TissSP.TissProfissional.TissfCBOS := dmDados.qyMedicoscbo_codigo.Text;
          TissSP.TissContratado.TissNomeContradado := Trim(RemoveAcento(dmDados.qyMedicosmed_nome.Text));

          //Profissional - médico
          TissSP.TissProfissional.TissProf := Trim(RemoveAcento(dmDados.qyMedicosmed_nome.Text));
          TissSP.TissProfissional.TissSiglaConselho := Trim(dmDados.qyMedicoscos_id.Text);
          TissSP.TissProfissional.TissNumConselho := Trim(dmDados.qyMedicosmed_numconselho.Text);
          TissSP.TissProfissional.TissUFConselho := Trim(dmDados.qyMedicoscos_uf.Text);
          reXML.Lines.Add('Finalizado dados solicitante guia n.° ' + IntToStr(vCont) + '...');
        //6 - final dadosSolicitante
        //7 - prestadorExecutante
          //Teste de verificação do CNPJ
          if cbTipoDoc.ItemIndex = 0 then
            TissSP.TissPrestadorExec.TissCNPJCPF := Trim(LimpaDoc(dmDados.qyEmpresaemp_cnpj.Text))
          else
            TissSP.TissPrestadorExec.TissCNPJCPF := Trim(edCodigo.Text);
          TissSP.TissPrestadorExec.TissNomeContradado := Trim(RemoveAcento(dmDados.qyEmpresaemp_razao.Text));
          TissSP.TissPrestadorExec.TissCNES := StrToFloat(dmDados.qyEmpresaemp_cnes.Text);

          //Tipo de atendimento - caso não tenha sido selecionado, usa padrão.

          FiltrarExamesTISS('exa_id', '=', dmDados.qyExamesexa_id.Text, '0', '0');
          if dmDados.qyExamesTISStis_tipoatend.IsNull then
            TissSP.TisscaraterAtend := '1' //E = Eletivo
          else
            dmDados.qyExamesTISStis_tipoatend.Text;

          TissSP.TissindicClinica := '1';

          //Indicação de acidente
          case cbAcidente.ItemIndex of
            0: TissSP.TissindicAcidente := '9';
            1: TissSP.TissindicAcidente := '0';
            2: TissSP.TissindicAcidente := '1';
            3: TissSP.TissindicAcidente := '2';
          end;

          TissSP.TissDataAtend := dmDados.qyExamesexa_data.Value;
          TissSP.TissTipoSaida := '1';

          FiltrarExamesTISS('exa_id', '=', dmDados.qyExamesexa_id.Text, '0', '0');
          if dmDados.qyExamesTISStis_tipoatend.IsNull then
            TissSP.TissTipoAtend := 5
          else
            TissSP.TissTipoAtend := dmDados.qyExamesTISStis_tipoatend.Value;

          TissSP.adicionarGuia;

          reXML.Lines.Add('Finalizado dados executante guia n.° ' + IntToStr(vCont) + '...');
        //7 - final prestadorExecutante
        //8 - procedimentosRealizados
          //Conta quantidade da tabela de procedimentos para o exame
          vExaID := dmDados.qyHistRecexa_id.Text;
          dmDados.QTemp.Close;
          dmDados.QTemp.SQL.Clear;
          dmDados.QTemp.SQL.Add('select count(exa_id) from examesproced where exa_id = ');
          dmDados.QTemp.SQL.Add(QuotedStr(vExaID));
          dmDados.QTemp.Open;
          if not dmDados.QTemp.Fields[0].IsNull then
            vQuantProc := dmDados.QTemp.Fields[0].Value;
          //Filtro da tabela de procedimentos
          dmDados.qyExamesProced.Close;
          dmDados.qyExamesProced.SQL.Clear;
          dmDados.qyExamesProced.SQL.Add('select * from examesproced where exa_id = ');
          dmDados.qyExamesProced.SQL.Add(QuotedStr(vExaID));
          dmDados.qyExamesProced.Open;
          dmDados.qyExamesProced.First;

          //Repete e insere Procedimentos executados
          if vQuantProc > 0 then
          begin
            for vContProced := 1 to vQuantProc do
            begin
              if ((dmDados.qyExamesProcedprc_tuss.IsNull) or (dmDados.qyExamesProcedprc_tuss.Text = '')) then
              begin
                reXML.Lines.Add('ERRO - FALTA PREENCHIMENTO DO PROCEDIMENTO guia n.° ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro + '...');
                vErros := vErros + 1;
                MessageDlg('Falta preenchimento do procedimento da guia: ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro, mtError, [mbok], 0);
              end
              else
                TissSP.TissProc.TissProcs.TissCodigo := Trim(dmDados.qyExamesProcedprc_tuss.Text);
              TissSP.TissProc.TissProcs.TissTipTabela := vTabPadrao; //Tabela padrão
              TissSP.TissProc.TissProcs.TissDescricao := Trim(RemoveAcento(dmDados.qyExamesProcedprc_descricao.Text));
              TissSP.TissProc.TissData := dmDados.qyExamesexa_data.Value;
              TissSP.TissProc.TissQtde := dmDados.qyExamesProcedexp_quant.Value;
              if cbZerado.Checked = false then
                TissSP.TissProc.TissValor := dmDados.qyExamesProcedexp_unitario.Value
              else
                TissSP.TissProc.TissValor := 0;
              if cbZerado.Checked = false then
                TissSP.TissProc.TissValorTotal := dmDados.qyExamesProcedexp_total.Value
              else
                TissSP.TissProc.TissValorTotal := 0;
              TissSP.TissProc.TissValorTotalGeral := TissSP.TissProc.TissValorTotalGeral + TissSP.TissProc.TissValorTotal;

              //Incluido versão 3.02.00 - Inserido manualmente
              TissSP.TissProc.TissVdeAcesso := '1';
              TissSP.TissProc.TissTecUtil := '1';

              //Alterações: Equipe SADT ----------------------------------------
              if TissSP.Tissconfig.TissProc.TissUsarEquipe = true then
              begin
                dmDados.qyResposnsaveis.Close;
                dmDados.qyResposnsaveis.SQL.Clear;
                dmDados.qyResposnsaveis.SQL.Add('select * from responsaveis ');
                dmDados.qyResposnsaveis.SQL.Add('where res_codigo = ');
                dmDados.qyResposnsaveis.SQL.Add(vIDResp);
                dmDados.qyResposnsaveis.Open;
                //SADT Campo 48 - Número sequencial
                //Ver campo := vContProced;
                //SADT Campo 49 - Grau de participação
                TissSP.TissProc.TissEquipe.TissProfiss.TissPosicProf := StrToInt(edGrauPart.Text);
                //SADT Campo 50 - Código na operadora / ou CPF do médico
                if ((Cpf(dmDados.qyResposnsaveisres_cpf.Text) = false) or (dmDados.qyResposnsaveisres_cpf.Text = '000.000.000-00') or
                    (dmDados.qyResposnsaveisres_cpf.Text = '00000000000')) then
                begin
                  MessageDlg('CPF do Profissional executante (Responsável) inválido!', mtError, [mbOk], 0);
                  vErros := vErros + 1;
                  reXML.Lines.Add('ERRO - CPF INVÁLIDO DO RESPONSÁVEL (' + dmDados.qyResposnsaveisres_nome.Text + ') guia n.° ' + IntToStr(vCont) + ' no exame: ' + vIDExameErro + '...');
                end
                else
                  TissSP.TissProc.TissEquipe.TissCodProf := LimpaDoc(dmDados.qyResposnsaveisres_cpf.Text);
                //SADT Campo 51 - Nome do profissional
                TissSP.TissProc.TissEquipe.TissProfiss.TissProf := dmDados.qyResposnsaveisres_nome.Text;
                //SADT Campo 52 - Conselho profissional (código)
                TissSP.TissProc.TissEquipe.TissProfiss.TissSiglaConselho := dmDados.qyResposnsaveiscos_id.Text;
                //SADT Campo 53 - Número do conselho
                TissSP.TissProc.TissEquipe.TissProfiss.TissNumConselho := dmDados.qyResposnsaveisres_numconselho.Text;
                //SADT Campo 54 - Sigla do conselho
                TissSP.TissProc.TissEquipe.TissProfiss.TissUFConselho := GetCodUF(dmDados.qyResposnsaveiscos_uf.Text);
                //SADT Campo 55 - CBO do profissional
                TissSP.TissProc.TissEquipe.TissProfiss.TissfCBOS := dmDados.qyResposnsaveiscbo_codigo.Text;
              end;
              TissSP.adicionaProc;
              dmDados.qyExamesProced.Next;
              reXML.Lines.Add('Inserido procedimento ' + IntToStr(vContProced) + ' guia n.° ' + IntToStr(vCont) + '...');
            end;
          end
          else
          begin
            reXML.Lines.Add('ERRO - FALTA PREENCHIMENTO DO PROCEDIMENTO guia n.° ' + IntToStr(vCont)  + ' no exame: ' + vIDExameErro+ '...');
            vErros := vErros + 1;
            MessageDlg('Falta preenchimento do procedimento da guia: ' + IntToStr(vCont)  + ' no exame: ' + vIDExameErro, mtError, [mbok], 0);
          end;
          reXML.Lines.Add('Finalizado procedimentos guia n.° ' + IntToStr(vCont) + '...');
        //8 - final procedimentosRealizados
        reXML.Lines.Add('Finalizado faturamento guia n.° ' + IntToStr(vCont) + '...');
      //2 - final guiaFaturamento
      reXML.Lines.Add('Finalizado dados Prestador -> Operadora guia n.° ' + IntToStr(vCont) + '...');
    //1 - final prestadorParaOperadora
    dmDados.qyHistRec.Next;
    reXML.Lines.Add('Finalizado guia n.° ' + IntToStr(vCont) + '...');
    TissSP.finalizaGuia;
  end;
  //TissSP.finalizaProc;
  //Finalizar a guia
  reXML.Lines.Add('Erros: ' + IntToStr(vErros));
  Gauge.Visible := false;
  frmPrincipal.Cursor := crDefault;
  reXML.Cursor := crDefault;
  reXML.Lines.Add('Gerando TISS...');
  TissSP.GerarXml;
  if ((TissSP.TissValidado = false) or (vErros > 0)) then
  begin
    if MessageDlg('Deseja carregar o arquivo gerado para verificação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      reXML.Lines.LoadFromFile(TissSP.Tisscabecalho.TissArquivo);
    end;
  end
  else
  begin
    reXML.Lines.Add('Configurando Separador decimal TISS...');
    DecimalSeparator := ',';
    reXML.Lines.Add('Limpando e carregando TISS...');
    reXML.Lines.Clear;
    //Carrega RichEdit
    reXML.Lines.LoadFromFile(TissSP.Tisscabecalho.TissArquivo);
    //Criar rodapé
    if FileExists(TissSP.Tisscabecalho.TissArquivo) then
    begin
      //Atualiza rectiss para sair cobrança já gerada da lista
      dmDados.qyRecTiss.Close;
      dmDados.qyRecTiss.SQL.Clear;
      dmDados.qyRecTiss.SQL.Add('select * from rectiss where rec_codigo = ');
      dmDados.qyRecTiss.SQL.Add(QuotedStr(dmDados.qyReceberrec_codigo.Text));
      dmDados.qyRecTiss.Open;
      if not dmDados.qyRecTissrti_id.IsNull then
      begin
        dmDados.qyRecTiss.Edit;
        dmDados.qyRecTissrti_gerado.Value := true;
        dmDados.qyRecTissrti_lote.Value  := dmDados.qyTisstiss_lote.Value;
        dmDados.qyRecTissrti_nguias.Value := vQuantExames;
        dmDados.qyRecTiss.Post;
      end;
    end;
    //Atualiza detalhes TISS
    dmDados.qyTiss.Edit;
    dmDados.qyTisstiss_sequencial.Value := dmDados.qyTisstiss_sequencial.Value + 1;
    dmDados.qyTisstiss_lote.Value := dmDados.qyTisstiss_lote.Value + 1;
    dmDados.qyTiss.Post;
    reXML.Lines.Clear;
    reXML.Lines.LoadFromFile(TissSP.Tisscabecalho.TissArquivo);
    FiltraRec;
    //Verifica se a cobranca foi baixada e o arquivo gerado, então tudo ok
    MessageDlg('Tiss gerado com sucesso no arquivo:' + #13 + TissSP.Tisscabecalho.TissArquivo, mtInformation, [mbOk] ,0);
    lbArqGer.Caption := TissSP.Tisscabecalho.TissArquivo;
    if MessageDlg('Deseja compactar o arquivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Try
        SaveDialog1.FileName := TissSP.Tisscabecalho.TissArquivo;
        if cbCompactador.ItemIndex = 0 then
        begin
          vTemp := ChangeFileExt(SaveDialog1.FileName, '.rar');
          vLinhaComando := vgInstWinrar + 'WINRAR.EXE a "' + vTemp + '" "' + SaveDialog1.FileName + '"';
          WinExec(PAnsichar(AnsiString(vLinhaComando)), 1);
          MessageDlg(vLinhaComando + #13 + 'Arquivo compactado com sucesso!', mtInformation, [mbOk], 0);
        end;
        if cbCompactador.ItemIndex = 1 then
        begin
          vTemp := ChangeFileExt(SaveDialog1.FileName, '.zip');
          vLinhaComando := vgInstWinZip + 'WINZIP32.EXE -a "' + vTemp + '" "' + SaveDialog1.FileName + '"';
          WinExec(PAnsiChar(AnsiString(vLinhaComando)), 1);
          MessageDlg(vLinhaComando + #13 + 'Arquivo compactado com sucesso!', mtInformation, [mbOk], 0);
        end
      Except
        MessageDlg('Não foi possível compactar o arquivo!', mtWarning, [mbOk], 0);
      end;
    end;
  end;
  if TissSP.TissValidado = false then
  begin
    //caso não valide, apaga arquivo xml
    DeleteFile(TissSP.Tisscabecalho.TissArquivo);
  end;
  except
    frmPrincipal.Cursor := crDefault;
    reXML.Cursor := crDefault;
    MessageDlg('Não foi possível gerar a TISS!', mtError, [mbOk], 0);
    cbTipoDoc.ItemIndex := 0;
    cbRefazer.Checked := false;
    Gauge.Visible := false;
  end;
end;

procedure TfrmPrincipal.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
Var
vPath, vDiretorio, vVersaoPadrao: String;
vControl: TInifile;
begin
  //Versão do módulo: 2 - TISS
  AtualizaSGDB('2');
  Screen.OnActiveControlChange := ProCode;
  lbArqGer.Caption := '';
  //carrega configurações do .ini
  vPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  vControl := Tinifile.create(vPath + '\genesis.ini');
  edGrauPart.Text := vControl.ReadString('Tiss', 'GrauPart', '');
  vVersaoPadrao := vControl.readstring('Tiss', 'ArquivoXSD', '');
  vControl.Free;

  if vVersaoPadrao = 'tissV3_03_01' then
    vVersaoPadrao := '3.03.01';
  if vVersaoPadrao = 'tissV3_03_02' then
    vVersaoPadrao := '3.03.02';
  if vVersaoPadrao = 'tissV3_03_03' then
    vVersaoPadrao := '3.03.03';
  cbVersao.Text := vVersaoPadrao;

  //Busca informação Grau de participação
  cbZerado.Checked := false;
  cbCompactador.ItemIndex := 1;
  cbCodificacao.ItemIndex := 0;
  cbEquipe.ItemIndex := 0;
  cbAcidente.ItemIndex := 0;
  //Abre tabelas
  dsConvenios.DataSet.Active := true;
  dsEmpresa.DataSet.Active := true;
  dsMedicos.DataSet.Active := true;
  //dsPacientes.DataSet.Active := true;
  dsReceber.DataSet.Active := true;
  dsTiss.DataSet.Active := true;
  lbCodigo.Enabled := false;
  edCodigo.Enabled := False;
  Gauge.Visible := false;
  //Carrega versão do TISS
  frmPrincipal.Caption := 'Geração XML Vs. TISS ' + vVersaoPadrao + ' - SP/SADT - [ENVIO_LOTE_GUIAS] - Vs. ' + VersaoSistema(0);
  {$IFDEF DEBUG}
    frmPrincipal.Caption := 'Geração XML Vs. TISS ' + vVersaoPadrao + ' - SP/SADT - [ENVIO_LOTE_GUIAS] - Vs. ' + VersaoSistema(0) + ' - DEBUG VERSION';
  {$ENDIF}
  //Limpa memo
  reXML.Clear;
  cbRefazer.Checked := false;
  cbTipoDoc.ItemIndex := 0;
  cbConvenio.Text := dmDados.lkConvenioscov_descricao.Text;
  FiltraRec;
end;

procedure TfrmPrincipal.cbConvenioExit(Sender: TObject);
begin
  FiltraRec;
end;

procedure TfrmPrincipal.cbRefazerClick(Sender: TObject);
begin
  FiltraRec;
end;

procedure TfrmPrincipal.cbConvenioKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    cbCobranca.SetFocus;
end;

procedure TfrmPrincipal.cbCobrancaEnter(Sender: TObject);
begin
  if not(dmDados.qyReceberrec_vencimento.IsNull) then
    cbCobranca.Text := dmDados.qyReceberrec_vencimento.Text;
end;

procedure TfrmPrincipal.cbTipoDocChange(Sender: TObject);
begin
  if cbTipoDoc.ItemIndex = 0 then
  begin
    edCodigo.Clear;
    lbCodigo.Enabled := false;
    edCodigo.Enabled := false;
  end
  else
  begin
    lbCodigo.Enabled := true;
    edCodigo.Enabled := true;
  end;
end;

procedure TfrmPrincipal.cbVersaoChange(Sender: TObject);
Var
vPath, vDiretorio, vVersaoPadrao: String;
vControl: TInifile;
vVersaoXSD: String;
begin
  if cbVersao.Text = '3.03.01' then
    vVersaoXSD := 'tissV3_03_01';
  if cbVersao.Text = '3.03.02' then
    vVersaoXSD := 'tissV3_03_02';
  if cbVersao.Text = '3.03.03' then
    vVersaoXSD := 'tissV3_03_03';
  vPath := DiretorioSemBarra(ExtractFileDir(Application.ExeName));
  vControl := Tinifile.create(vPath + '\genesis.ini');
  vControl.writestring('Tiss', 'ArquivoXSD', vVersaoXSD);
  vControl.Free;
end;

procedure TfrmPrincipal.Expandirtodos1Click(Sender: TObject);
begin
  TreeView1.FullExpand;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.database.Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Application.HintPause := 2000;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrincipal.lbArqGerClick(Sender: TObject);
begin
{
  XMLDocument1.LoadFromFile(lbArqGer.Caption);
  XMLDocument1.Active := true;
  TreeView1.Items.Clear;
  AdicionaNo(XMLDocument1.DocumentElement, nil);
  PageControl1.ActivePage := tsTreeView;
}
end;

procedure TfrmPrincipal.btAbrirClick(Sender: TObject);
Var
vArqTemp: String;
begin
  if FileExists(lbArqGer.Caption) then
    OpenDialog1.FileName := lbArqGer.Caption;
  if OpenDialog1.Execute then
  begin
    vArqTemp := OpenDialog1.FileName;
    vgOpenXML := OpenDialog1.FileName;
    frmXML.ShowModal;
  end;
end;

end.
