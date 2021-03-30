% Описываем пространство знаний
% Для примера, опишем кто что любит
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

% А потом, опишем правила определения того, кто чей друг
% Это правило
friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
