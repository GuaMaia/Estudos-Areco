unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TFprincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    CadastrodeProduto1: TMenuItem;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fprincipal: TFprincipal;

implementation

{$R *.dfm}

uses UGerProduto;

procedure TFprincipal.CadastrodeProduto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFGerProduto, FGerProduto);
    FGerProduto.ShowModal;
  finally
    FreeAndNil(FGerProduto);
  end;
end;

procedure TFprincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
