unit FluxoDeCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox;

type
  TfrmFluxoDeCaixa = class(TForm)
    lblMyLabel: TLabel;
    nmbEntryValue: TNumberBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoDeCaixa: TfrmFluxoDeCaixa;

implementation

{$R *.dfm}

end.
