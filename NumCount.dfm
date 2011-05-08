object Form2: TForm2
  Left = 423
  Top = 429
  Caption = 'Number Counter'
  ClientHeight = 41
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Open: TButton
    Left = 40
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = OpenClick
  end
  object Save: TButton
    Left = 184
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = SaveClick
  end
  object tme: TTimer
    Interval = 100
    OnTimer = tmeTimer
  end
  object tme2: TTimer
    Interval = 5000
    OnTimer = tme2Timer
  end
  object odl: TOpenDialog
  end
  object sdl: TSaveDialog
  end
end
