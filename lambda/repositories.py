import time
import uuid
from typing import Any, Dict, Union

from schemas import ProductSchemaIn, ProductSchemaOut
from tables import EcommerceTable


class ProductRepository:
    table: EcommerceTable = EcommerceTable  # type: ignore
    schema_out: ProductSchemaOut = ProductSchemaOut  # type: ignore

    @staticmethod
    def _preprocess_create(values: Dict[str, Any]) -> Dict[str, Any]:
        timestamp_now = time.time()
        values["id"] = str(uuid.uuid4())
        values["created_at"] = timestamp_now
        values["updated_at"] = timestamp_now
        return values

    @classmethod
    def create(cls, product_in: ProductSchemaIn) -> ProductSchemaOut:
        data = cls._preprocess_create(product_in.dict())
        model = cls.table(**data)  # type: ignore
        model.save()
        return cls.schema_out(**model.attribute_values)  # type: ignore

    @classmethod
    def get(cls, entry_id: Union[str, uuid.UUID]) -> ProductSchemaOut:
        model = cls.table.get(str(entry_id))
        return cls.schema_out(**model.attribute_values)  # type: ignore
