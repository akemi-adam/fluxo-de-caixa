program prjFluxoDeCaixa;

uses
  Vcl.Forms,
  FluxoDeCaixa in 'FluxoDeCaixa.pas' {frmFluxoDeCaixa},
  NewCashFlow in 'NewCashFlow.pas' {frmNewCashFlow};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFluxoDeCaixa, frmFluxoDeCaixa);
  Application.CreateForm(TfrmNewCashFlow, frmNewCashFlow);
  Application.Run;
end.
