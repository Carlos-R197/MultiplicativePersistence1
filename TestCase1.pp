{$mode objfpc}{$H+}

unit TestCase1;

interface

uses FPCUnit, TestRegistry, TestUtils, Persistence;

type
  TTestCase1 = class(TTestCase)
  private
	FPersistence: TPersistence;
  protected
    procedure SetUp; override;
	procedure TearDown; override;
  published
	procedure FirstTest;
	procedure SecondTest;
	procedure ThirdTest;
	procedure FourthTest;
	procedure FifthTest;
  end;
	
implementation
  
procedure TTestCase1.SetUp;
begin
  FPersistence:=  TPersistence.Create;
end;

procedure TTestCase1.TearDown;
begin
  FPersistence.Free;
end;

procedure TTestCase1.FirstTest;
begin
  AssertEquals(0, FPersistence.Persistence(5));
end;

procedure TTestCase1.SecondTest;
begin
  AssertEquals(3, FPersistence.Persistence(198));
end;

procedure TTestCase1.ThirdTest;
begin
  AssertEquals(3, FPersistence.Persistence(-198));
end;

procedure TTestCase1.FourthTest;
begin
  AssertEquals(2, FPersistence.Persistence(15961));
end;

procedure TTestCase1.FifthTest;
begin
  AssertEquals(5, FPersistence.Persistence(796));
end;

initialization
  RegisterTest(TTestCase1);
end.