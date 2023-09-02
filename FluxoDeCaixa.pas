unit FluxoDeCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmFluxoDeCaixa = class(TForm)
    lsbCashList: TListBox;
    lblPeriod: TLabel;
    btnNewPeriod: TButton;
    lblCashFlow: TLabel;
    btnNewCashFlow: TButton;
    FDConnection: TFDConnection;
    queryPeriod: TFDQuery;
    procedure btnNewCashFlowClick(Sender: TObject);
    procedure btnNewPeriodClick(Sender: TObject);
    procedure frmOnCreate(Sender: TObject);
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
    frmNewCashFlow.ShowModal;
  end;

  procedure TfrmFluxoDeCaixa.btnNewPeriodClick(Sender: TObject);
  var today: string;
  begin
    FDConnection.Connected := True;
    try
      // Verify if period already registered
      queryPeriod.Connection := FDConnection;
      today :=  DateToStr(Now);
      queryPeriod.SQL.Text := 'SELECT COUNT(id) AS Total FROM periods WHERE substr(date, 4, 2) = ''' + Copy(today, 4, 2) + '''';
      queryPeriod.Open;
      if queryPeriod.FieldByName('Total').AsInteger = 1 then
        begin
          ShowMessage('O período desse mês já foi cadastrado');
          Exit;
        end;
      // Resgister new period
      queryPeriod.SQL.Text := 'INSERT INTO periods (date) VALUES (:date)';
      queryPeriod.ParamByName('date').AsString := today;
      queryPeriod.ExecSQL;
      ShowMessage('Período criado com sucesso!');
    except
      on e: Exception do
      begin
        ShowMessage('Houve um erro ao criar o período: ' + e.Message);
      end;
    end;
    FDConnection.Connected := False;
  end;

  procedure TfrmFluxoDeCaixa.frmOnCreate(Sender: TObject);
  begin
    FDConnection.Connected := True;
    try
      queryPeriod.Connection := FDConnection;
      queryPeriod.SQL.Text := 'SELECT * FROM periods';
      queryPeriod.Open;
      lsbCashList.Items.Clear;
      while not queryPeriod.Eof do
      begin
        lsbCashList.Items.Add('Fluxo de ' + queryPeriod.FieldByName('date').AsString);
        queryPeriod.Next;
      end;
    finally
      queryPeriod.Close;
      queryPeriod.DisposeOf;
    end;
      FDConnection.Connected := False;
  end;

end.
