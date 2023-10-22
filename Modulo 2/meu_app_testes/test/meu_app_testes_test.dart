import 'package:meu_app_testes/classes/viacep.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MockViaCEP])
void main() {
  test('Calcula o desconto do produto sem porsentagem', () {
    expect(app.calcDiscount(1000, 150, false), equals(850));
  });

  test(
      'Calcula o desconto do produto sem porsentagem passando o valor do produto zerado',
      () {
    expect(() => app.calcDiscount(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o desconto do produto com porsentagem', () {
    expect(app.calcDiscount(1000, 15, true), equals(850));
  });

  test('Calcula o desconto do produto com porsentagem zerada', () {
    expect(() => app.calcDiscount(1000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group('Calcula o valor do produto com desconto: ', () {
    var valuesToTest = {
      {
        'valor': 1000,
        'desconto': 150,
        'percentual': false,
      }: 850,
      {
        'valor': 1000,
        'desconto': 15,
        'percentual': true,
      }: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values: Esperado: $expected', () {
        expect(
            app.calcDiscount(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group(
      'Calcula o valor do produto informando valores zerados, deve gerar erro ',
      () {
    var valuesToTest = {
      {
        'valor': 0,
        'desconto': 150,
        'percentual': false,
      },
      {
        'valor': 1000,
        'desconto': 0,
        'percentual': true,
      },
    };
    for (var values in valuesToTest) {
      test('Entrada: $values: ', () {
        expect(
            () => app.calcDiscount(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testar conversao UpperCase', () {
    expect(app.convertToUpper("euler"), equals("EULER"));
  });

  test('Testar conversao UpperCase 2', () {
    expect(app.convertToUpper("euler"), equalsIgnoringCase("euler"));
  });

  test('Valor maior que 50', () {
    expect(app.returnValue(50), greaterThanOrEqualTo(50));
  });

  test('COmeçca com:', () {
    expect(app.convertToUpper("euler"), startsWith("E"));
  });

  test('Valor diferente', () {
    expect(app.returnValue(50), isNot(equals(48)));
  });

  test('Retornar cep', () async {
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.returnCep("01001000"))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));

    var body = await mockMockViaCEP.returnCep("01001000");
    print(body);
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCEP extends Mock implements ViaCEP {}
