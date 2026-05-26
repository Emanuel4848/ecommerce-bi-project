import pandas as pd


productos = pd.read_csv("../data/productos.csv")
categorias = pd.read_csv("../data/categorias.csv")


productos.columns = productos.columns.str.strip()
categorias.columns = categorias.columns.str.strip()


productos["Precio_Unitario"] = (
    productos["Precio_Unitario"]
    .astype(str)
    .str.replace(",", ".", regex=False)
    .astype(float)
)


productos_limpio = productos.merge(
    categorias[["ID_Categoria", "Categoría"]],
    on="Categoría",
    how="left"
)


sin_categoria = productos_limpio[productos_limpio["ID_Categoria"].isna()]

if not sin_categoria.empty:
    print("Hay productos con categoría no encontrada:")
    print(sin_categoria[["ID_Producto", "Nombre_producto", "Categoría"]])
    raise ValueError("Corrige las categorías antes de continuar.")


productos_limpio = productos_limpio[
    ["ID_Producto", "Nombre_producto", "ID_Categoria", "Precio_Unitario", "Stock"]
]


productos_limpio.to_csv("../data/productos_limpio.csv", index=False)

print("productos_limpio.csv generado correctamente.")