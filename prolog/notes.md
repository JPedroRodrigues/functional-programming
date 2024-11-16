# Prolog

Prolog é baseado na lógica de predicados de primeira ordem, **cláusulas de Horn**.

**Aridade**: número de parênteses

--- 

|   Exemplo   |   O que é   | Significado |
|:-----------:|:-----------:|:-----------:|
|a.           |fato         |     ---     |
|b.           |fato         |     ---     |
|c :- a, b.   |regra        |*c* é verdadeiro **se** *a* **e** *b* forem verdadeiros (*a* e *b* implicam *c*)| 
|d :- e, f.   |regra        |*d* é verdadeiro **se** *e* **e** *f* forem verdadeiros (*e* e *f* implicam *d*)|
|d :- c.      |regra        |*d* é verdadeiro  **se** *c* for verdadeiro|


## Conceitos-chave

- **Fato**: 
    - Consiste em uma verdade absoluta e não depende de nada para ser verdadeiro.
    - A ausência de fatos é considerada uma falsidade.

- **Regra**: 
    - Uma regra depende de algo para ser verdadeira

- **Predicado**:
    - Retorna verdadeiro e falso e, por efeito colateral, retorna a nós a resposta que queremos;
    - Um fato unido a um predicado e a uma pesquisa, forma um teorema, que resultara em verdadeiro ou falso;
    - As variáveis devem iniciar com letra maiúscula;
    - Os predicados começam com linha minúscula;

    ```prolog
    /* Predicados de aridade 1 */
    casa(azul).
    casa(amarela).

    casa(M).
    
    M = azul?
    M = amarela?
    ```
- **Lista**:
    - `[]`;
    - `[1, 1, 1]`;
    - `[1, a, [2, 2, 3]]`;

