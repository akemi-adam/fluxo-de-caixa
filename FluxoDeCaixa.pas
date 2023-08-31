unit FluxoDeCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox, Data.DB;

type
  TfrmFluxoDeCaixa = class(TForm)
    lsbCashList: TListBox;
    lblPeriod: TLabel;
    btnNewPeriod: TButton;
    lblCashFlow: TLabel;
    btnNewCashFlow: TButton;
    procedure btnNewCashFlowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoDeCaixa: TfrmFluxoDeCaixa;



implementation

{$R *.dfm}

uses NewCashFlow;


  procedure TfrmFluxoDeCaixa.btnNewCashFlowClick(Sender: TObject);
  var frmNewCashFlow: TfrmNewCashFlow;
  begin
    frmNewCashFlow := TfrmNewCashFlow.Create(self);
    frmNewCashFlow.Show;
  end;

end.
