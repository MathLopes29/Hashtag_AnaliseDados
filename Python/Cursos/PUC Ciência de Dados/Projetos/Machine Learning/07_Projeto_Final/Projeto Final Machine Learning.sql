2. PROJETO FINAL – PIPELINE DE MACHINE LEARNING (50 pts)
2.1 Visão Geral
O Projeto Final consiste no desenvolvimento de um pipeline prático de Machine Learning de ponta a ponta (end-to-end),
aplicado a um problema real escolhido pelo próprio aluno. O objetivo é demonstrar domínio técnico e visão de negócio,
aplicando com rigor as melhores práticas discutidas ao longo da disciplina.
Cada aluno deverá escolher um problema real com um conjunto de dados real. A avaliação recai sobre o rigor metodológico
do pipeline — não sobre o dataset escolhido.
O aluno tem total liberdade para escolher o dataset e o problema de negócio. Datasets públicos de plataformas como
Kaggle, UCI ML Repository, Google Dataset Search ou dados reais do contexto profissional são bem-vindos.
2.2 Etapas Obrigatórias do Pipeline
O notebook deve implementar obrigatoriamente as seguintes etapas:
• Análise Exploratória de Dados (EDA)
◦ Verificação de distribuições, detecção analítica/visual de outliers
◦ Matriz de correlação e diagnóstico de dados ausentes
◦ Uso de ferramentas automatizadas (ex: ydata-profiling) é incentivado
• Feature Engineering
◦ Imputação de nulos com estratégia justificada
◦ Tratamento de outliers (IQR, Winsorização ou transformação log)
◦ Encodings adequados para alta e baixa cardinalidade
◦ Criação de novas features com base em conhecimento de domínio
◦ Transformações de escala quando necessárias
• Seleção de Features
◦ Seleção rigorosa das variáveis preditoras utilizando Boruta (via BorutaPy) ou métodos equivalentes (SelectKBest, RFE,
SelectFromModel)
• Modelagem Baseline
◦ Implementação de um estimador simples (Linear, Logístico ou Dummy) para fixar a métrica de referência
• Modelos de Alta Performance
◦ Treinamento e avaliação comparativa de pelo menos 3 modelos
◦ Recomendado: Random Forest, XGBoost, LightGBM e/ou CatBoost
• Tuning de Hiperparâmetros
◦ Otimização dos parâmetros do melhor modelo usando RandomizedSearchCV, GridSearchCV ou Optuna
• Interpretabilidade (SHAP)
◦ SHAP Summary Plot (importância global das features)
◦ SHAP Waterfall ou Force Plot (análise local de uma amostra individual)
• IA Generativa como Ferramenta de Apoio
◦ Uso de LLMs (ChatGPT, Copilot, etc.) para brainstorming de features, interpretação de métricas ou geração de código
◦ Documentar os prompts utilizados e os resultados obtidos em células Markdown


3. DOCUMENTAÇÃO TÉCNICA DO PROJETO FINAL (10 pts)
Um relatório técnico em formato PDF, redigido com linguagem formal e padrão executivo. Esta documentação traduz o
esforço do notebook em um artefato de governança e estratégia de engenharia. Máximo de 8 páginas.
Seção Conteúdo Esperado
1. Visão Geral do Projeto Contextualização do problema, justificativa de negócio, objetivo técnico do algoritmo
(tipo de problema) e limitações de escopo
2. Arquitetura de Dados e
Engenharia
Mapeamento das fontes de dados, estratégias de Feature Engineering e tratamento
adotadas
3. Modelagem e Validação Justificativa da seleção de features, registro do desempenho de todos os modelos
testados, estratégia de validação cruzada
4. Interpretabilidade e
Resultados
Análise dos impactos de SHAP (Global e Local) traduzidos para linguagem de negócio
5. Conclusões e Próximos
Passos
Principais aprendizados, limitações do modelo e sugestões de melhorias futuras
