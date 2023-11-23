unit untLoading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, GIFImg, JvGIF;

type
  TLoading = class(TForm)
    imgLoagind: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Loading: TLoading;

implementation

{$R *.dfm}

procedure TLoading.FormCreate(Sender: TObject);
begin
  TGIFImage(imgLoagind.Picture.Graphic).Animate := True;
end;

end.
