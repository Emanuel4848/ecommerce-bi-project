import pandas as pd


ventas = pd.read_csv("../data/ventas.csv")


ventas.columns = ventas.columns.str.strip()


ventas["Fecha"] = pd.to_datetime(
    ventas["Fecha"],
    format="%d/%m/%Y"
).dt.strftime("%Y-%m-%d")



duplicados = ventas[ventas.duplicated(subset=["ID_Venta"], keep=False)]

if not duplicados.empty:
    print("Ventas duplicadas encontradas:")
    print(duplicados.sort_values("ID_Venta").head(20))
    print("Total duplicados:", len(duplicados))


ventas = ventas.drop_duplicates(subset=["ID_Venta"], keep="first")


ventas = ventas[
    [
        "ID_Venta",
        "Fecha",
        "ID_Cliente",
        "ID_Producto",
        "Cantidad",
        "Método_Pago",
        "Estado"
    ]
]


ventas.to_csv("../data/ventas_limpio.csv", index=False)

print("ventas_limpio.csv generado correctamente.")