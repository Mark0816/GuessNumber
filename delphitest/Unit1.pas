unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
procedure test();

Function test2(abc :String):Integer;
var
  Form1: TForm1;
  answer: Integer;
  high: Integer;
  Low: Integer;
  Highrange: String;
  Lowrange: String;


type
  num_record = record //QA
    input_1: String;
    integer_1: Integer;
end;



implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  num: num_record;    //QA

begin

  try
    num.input_1 := Edit1.Text;
    num.integer_1 :=  StrToInt(num.input_1); //轉數字
  except
    ShowMessage('請輸入整數數字');
    exit;
  end;

  if (num.integer_1 <= Low) or (num.integer_1 >= High) then begin
    ShowMessage('請輸入範圍內的數字');
    exit;
  end;

  if(num.integer_1 < answer) then  begin
//          ShowMessage('繼續');
    Low := num.integer_1;
    Lowrange := IntToStr(Low);
    Highrange := IntToStr(High);
    Memo1.Lines.clear;
    Memo1.Lines.Add(Lowrange+'~'+Highrange);
//          Memo1.Lines.Add('~');
//          Memo1.Lines.Add(Highrange);
    exit;  //QA
  end;

  if(num.integer_1 > answer) then begin
    High := num.integer_1;
//          ShowMessage('繼續');
    Lowrange := IntToStr(Low);
    Highrange := IntToStr(High);
    Memo1.Lines.clear;
    Memo1.Lines.Add(Lowrange+'~'+Highrange);
//          Memo1.Lines.Add('~');
//          Memo1.Lines.Add(Highrange);
    exit;
  end;


  Memo1.Lines.ADD('猜對了');
  button1.enabled := false;
  button2.enabled := false;

end;

procedure test();
begin
  high := 100;
  Low := 0;
  Randomize;
//  Form1.Memo1.Lines.Clear;
//  Form1.Label2.Caption:=IntToStr(Random(100));
//  Form1.Label2.Hide;
//  answer := StrToInt(Form1.Label2.Caption);
  With Form1 do
  begin
     Memo1.Lines.Clear;
     Label2.Caption:=IntToStr(Random(100));
     Label2.Hide;
     answer := StrToInt(Label2.Caption);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Label2.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  test();
  button1.enabled := true;
  button2.enabled := true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage(test2('abc').ToString);
end;

Function test2(abc :String):Integer;
begin
   ShowMessage(abc);
   result := 100;
   exit;
   result := 200;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  test();
end;
end.
