program Cadastro_Produto;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {Fprincipal},
  UFrame_Gerenciador in 'Frame\UFrame_Gerenciador.pas' {FFrame_Gerenciador: TFrame},
  UGerProduto in 'UGerProduto.pas' {FGerProduto},
  UJsonDTO in 'UJsonDTO.pas',
  UFrame_Cadastro in 'Frame\UFrame_Cadastro.pas' {FFrame_Cadastro: TFrame},
  UCadProduto in 'UCadProduto.pas' {FCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Areco';
  Application.CreateForm(TFprincipal, Fprincipal);
  Application.Run;
end.
