# Prolog

Prolog é baseado na lógica de predicados de primeira ordem, **cláusulas de Horn**.

**Aridade**: número de parênteses

--- 

```pl
a.              /* fato */
b.              /* fato */
c :- a, b.      /* c é verdadeiro se a e b forem verdadeiros = SE "a" e "b" ou "a" e "b" implicam em "c" */
d :- e, f.      /* d SE "e" e "f" forem verdades */
                            /* OU */
d :- c.         /*  d é verdade SE "c" */
```

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

    ```pl
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