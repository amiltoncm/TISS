unit dataDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dataTmpConexao, DB, SDEngine;

type
  TdmDados = class(TdmTmpConexao)
    lkConvenios: TSDQuery;
    lkConvenioscov_codigo: TIntegerField;
    lkConvenioscov_descricao: TStringField;
    lkConvenioscov_cnpj: TStringField;
    qyReceber: TSDQuery;
    qyTiss: TSDQuery;
    qyTisstiss_cfg: TIntegerField;
    qyTisstiss_sequencial: TIntegerField;
    qyTisstiss_versaopadrao: TStringField;
    updTiss: TSDUpdateSQL;
    lkConvenioscov_regans: TStringField;
    qyEmpresa: TSDQuery;
    qyEmpresaemp_id: TIntegerField;
    qyEmpresaemp_razao: TStringField;
    qyEmpresaemp_cnpj: TStringField;
    qyEmpresaemp_ie: TStringField;
    qyEmpresaemp_inscmun: TStringField;
    qyEmpresaemp_logradouro: TStringField;
    qyEmpresaemp_bairro: TStringField;
    qyEmpresaemp_cidade: TStringField;
    qyEmpresaemp_uf: TStringField;
    qyEmpresaemp_cep: TStringField;
    qyEmpresaemp_telefone: TStringField;
    qyEmpresaemp_email: TStringField;
    qyEmpresaemp_homepage: TStringField;
    qyEmpresaemp_cnes: TStringField;
    qyHistRec: TSDQuery;
    qyHistRechis_id: TIntegerField;
    qyHistRechis_item: TIntegerField;
    qyHistRechis_data: TDateField;
    qyHistRecexa_id: TStringField;
    qyHistReccov_codigo: TIntegerField;
    qyHistRecpac_codigo: TIntegerField;
    qyHistRechis_valor: TFloatField;
    qyHistRechis_gercob: TStringField;
    qyHistRecmed_codigo: TIntegerField;
    qyConvenios: TSDQuery;
    qyConvenioscov_codigo: TIntegerField;
    qyConvenioscov_descricao: TStringField;
    qyConvenioscov_cnpj: TStringField;
    qyConvenioscov_ie: TStringField;
    qyConveniostpl_id: TIntegerField;
    qyConvenioscov_logradouro: TStringField;
    qyConvenioscov_numero: TIntegerField;
    qyConvenioscov_bairro: TStringField;
    qyConvenioscid_codigo: TIntegerField;
    qyConvenioscov_fone: TStringField;
    qyConvenioscov_celular: TStringField;
    qyConvenioscov_fax: TStringField;
    qyConvenioscov_email: TStringField;
    qyConvenioscov_cep: TStringField;
    qyExames: TSDQuery;
    qyExamesexa_id: TStringField;
    qyExamesexa_data: TDateField;
    qyExamespac_codigo: TIntegerField;
    qyExamespac_idade: TSmallintField;
    qyExamespac_meses: TStringField;
    qyExamescov_codigo: TIntegerField;
    qyExamesexa_matricula: TStringField;
    qyExamesmed_codigo: TIntegerField;
    qyExamesexa_etapa: TIntegerField;
    qyExamesexa_prioridade: TIntegerField;
    qyExamesexa_dataprior: TDateField;
    qyExamesexa_obs: TStringField;
    qyExamesexa_origem: TIntegerField;
    qyExamesexa_destino: TIntegerField;
    qyExamesetp_id: TIntegerField;
    qyExamesres_codigo: TIntegerField;
    lkPacientes: TSDQuery;
    lkPacientespac_codigo: TIntegerField;
    lkPacientespac_nome: TStringField;
    qyExamesexa_paciente: TStringField;
    qyMedicos: TSDQuery;
    qyMedicosmed_codigo: TIntegerField;
    qyMedicosmed_nome: TStringField;
    qyMedicosmed_fone: TStringField;
    qyMedicoscos_id: TIntegerField;
    qyMedicosmed_numconselho: TStringField;
    qyMedicosmed_titulo: TStringField;
    qyMedicosmed_cpf: TStringField;
    lkConselho: TSDQuery;
    lkConselhocos_codigo: TIntegerField;
    lkConselhocos_tipo: TStringField;
    qyMedicosmed_conselho: TStringField;
    qyMedicoscos_uf: TStringField;
    qyExamesProced: TSDQuery;
    qyExamesProcedexp_id: TIntegerField;
    qyExamesProcedexa_id: TStringField;
    qyExamesProcedprc_tuss: TIntegerField;
    qyExamesProcedexp_quant: TIntegerField;
    qyExamesProcedexp_unitario: TFloatField;
    qyExamesProcedexp_total: TFloatField;
    lkProcedimentos: TSDQuery;
    lkProcedimentosprc_tuss: TIntegerField;
    lkProcedimentosprc_descricao: TStringField;
    lkProcedimentosprc_amr: TIntegerField;
    lkProcedimentosprc_descant: TStringField;
    lkProcedimentosprc_vlrhora: TFloatField;
    lkProcedimentosprc_vlroper: TFloatField;
    lkProcedimentosprc_vlrfilme: TFloatField;
    lkProcedimentosprc_vlrtotal: TFloatField;
    qyExamesProcedprc_descricao: TStringField;
    qyReceberrec_vencimento: TDateField;
    qyReceberrec_codigo: TIntegerField;
    qyReceberrec_nome: TStringField;
    qyReceberrec_valor: TFloatField;
    qyReceberrec_emissao: TDateField;
    qyRecebercov_codigo: TIntegerField;
    qyReceberhis_id: TIntegerField;
    qyRecebercob_codigo: TIntegerField;
    qyReceberrec_status: TStringField;
    qyReceberrec_codigo_1: TIntegerField;
    qyReceberrti_gerado: TBooleanField;
    qyReceberrti_id: TIntegerField;
    qyReceberrti_lote: TIntegerField;
    qyRecTiss: TSDQuery;
    updRecTiss: TSDUpdateSQL;
    qyRecTissrti_id: TIntegerField;
    qyRecTissrec_codigo: TIntegerField;
    qyRecTissrti_gerado: TBooleanField;
    qyRecTissrti_lote: TIntegerField;
    qyEmails: TSDQuery;
    updEmails: TSDUpdateSQL;
    qyEmailsema_id: TIntegerField;
    qyEmailsema_endereco: TStringField;
    qyExamesexa_guia: TStringField;
    qyMedicosmed_logradouro: TStringField;
    qyMedicosmed_numero: TIntegerField;
    qyMedicosmed_bairro: TStringField;
    qyMedicoscid_codigo: TIntegerField;
    qyTisstiss_lote: TIntegerField;
    qyConvenioscov_regans: TStringField;
    qyConvenioscov_veriftiss: TStringField;
    qyTisstab_id: TIntegerField;
    qyRecTissrti_nguias: TIntegerField;
    Sessao: TSDSession;
    qyModulos: TSDQuery;
    qyModulosmod_codigo: TIntegerField;
    qyModulosmod_executavel: TStringField;
    qyModulosmod_nome: TStringField;
    qyModulosmod_descricao: TStringField;
    qyModulosmod_versaoinst: TStringField;
    updModulos: TSDUpdateSQL;
    qyUf: TSDQuery;
    qyUfuf_sigla: TStringField;
    qyUfuf_estado: TStringField;
    qyUfuf_codigo: TIntegerField;
    qyMedicoscbo_codigo: TIntegerField;
    qyConvenioscov_codoperadora: TStringField;
    qyResposnsaveis: TSDQuery;
    qyResposnsaveisres_codigo: TIntegerField;
    qyResposnsaveisres_nome: TStringField;
    qyResposnsaveisres_titulo: TStringField;
    qyResposnsaveiscos_id: TIntegerField;
    qyResposnsaveisres_numconselho: TStringField;
    qyResposnsaveiscos_uf: TStringField;
    qyResposnsaveisres_iniciais: TStringField;
    qyResposnsaveiscbo_codigo: TIntegerField;
    qyResposnsaveisprt_codigo: TIntegerField;
    qyResposnsaveisres_cpf: TStringField;
    qyExamesAut: TSDQuery;
    qyExamesAutexa_id: TStringField;
    qyExamesAutaut_senha: TStringField;
    qyExamesAutaut_data: TDateField;
    qyExamesTISS: TSDQuery;
    qyExamesTISSexa_id: TStringField;
    qyExamesTISStis_tipoatend: TIntegerField;
    qyExamesCob: TSDQuery;
    qyExamesCobexa_id: TStringField;
    qyExamesCobres_nome: TStringField;
    qyExamesCobres_cpf: TStringField;
    qyExamesCobmed_nome: TStringField;
    qyExamesCobmed_cpf: TStringField;
    procedure qyTissAfterPost(DataSet: TDataSet);
    procedure qyTissBeforePost(DataSet: TDataSet);
    procedure qyTissPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyTissUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyRecTissAfterPost(DataSet: TDataSet);
    procedure qyRecTissBeforePost(DataSet: TDataSet);
    procedure qyRecTissPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyRecTissUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyEmailsAfterPost(DataSet: TDataSet);
    procedure qyEmailsBeforePost(DataSet: TDataSet);
    procedure qyEmailsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyEmailsUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure qyModulosAfterDelete(DataSet: TDataSet);
    procedure qyModulosAfterPost(DataSet: TDataSet);
    procedure qyModulosBeforeDelete(DataSet: TDataSet);
    procedure qyModulosBeforePost(DataSet: TDataSet);
    procedure qyModulosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qyModulosUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qyModulosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{$R *.dfm}

procedure TdmDados.qyTissAfterPost(DataSet: TDataSet);
begin
  qyTiss.ApplyUpdates;
  database.Commit;
  qyTiss.CommitUpdates;
end;

procedure TdmDados.qyTissBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDados.qyTissPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmDados.qyTissUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyTiss.RollbackUpdates;
end;

procedure TdmDados.qyRecTissAfterPost(DataSet: TDataSet);
begin
  qyRecTiss.ApplyUpdates;
  database.Commit;
  qyRecTiss.CommitUpdates;
end;

procedure TdmDados.qyRecTissBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDados.qyRecTissPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmDados.qyRecTissUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyRecTiss.RollbackUpdates;
end;

procedure TdmDados.qyEmailsAfterPost(DataSet: TDataSet);
begin
  qyEmails.ApplyUpdates;
  database.Commit;
  qyEmails.CommitUpdates;
end;

procedure TdmDados.qyEmailsBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDados.qyEmailsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmDados.qyEmailsUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyEmails.RollbackUpdates;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  Sessao.Close;
  Sessao.AutoSessionName := true;
  inherited;
  Sessao.Active := True;
  lkConvenios.Active := True;
end;

{--- qyModulos ---------------------------------------------------------------}

procedure TdmDados.qyModulosAfterDelete(DataSet: TDataSet);
begin
  qyModulos.ApplyUpdates;
  database.Commit;
  qyModulos.CommitUpdates;
end;

procedure TdmDados.qyModulosAfterPost(DataSet: TDataSet);
begin
  qyModulos.ApplyUpdates;
  database.Commit;
  qyModulos.CommitUpdates;
end;

procedure TdmDados.qyModulosBeforeDelete(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDados.qyModulosBeforePost(DataSet: TDataSet);
begin
  database.StartTransaction;
end;

procedure TdmDados.qyModulosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  database.Rollback;
end;

procedure TdmDados.qyModulosUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  database.Rollback;
  qyModulos.RollbackUpdates;
end;

procedure TdmDados.qyModulosAfterInsert(DataSet: TDataSet);
begin
  //
end;

end.
