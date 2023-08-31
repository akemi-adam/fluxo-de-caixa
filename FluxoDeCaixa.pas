unit FluxoDeCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client;

type
  TfrmFluxoDeCaixa = class(TForm)
    lsbCashList: TListBox;
    lblPeriod: TLabel;
    btnNewPeriod: TButton;
    lblCashFlow: TLabel;
    btnNewCashFlow: TButton;
    FDConnection: TFDConnection;
    Label1: TLabel;
    procedure btnNewCashFlowClick(Sender: TObject);
    procedure btnNewPeriodClick(Sender: TObject);
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

  procedure TfrmFluxoDeCaixa.btnNewPeriodClick(Sender: TObject);
  begin
    FDConnection.Params.Values['Database'] := GetCurrentDir + '\database.db';
    // Label1.Caption := 'Deu certo';
  end;

end.
