import pandas as pd
from sklearn.neural_network import MLPClassifier

X = pd.DataFrame([[0., 0.], [1., 1.]])
print(X)
y = pd.DataFrame([0, 1])
print(y)
clf = MLPClassifier(solver='lbfgs',
                    alpha=1e-5,
                    hidden_layer_sizes=(5, 2),
                    random_state=1)

clf.fit(X, y)
print(clf.predict([[2., 2.], [-1., -2.]]))
