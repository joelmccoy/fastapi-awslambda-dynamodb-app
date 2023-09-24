from pynamodb.attributes import NumberAttribute, UnicodeAttribute
from pynamodb.models import Model


class BaseTable(Model):
    class Meta:
        region = "us-east-1"


class EcommerceTable(BaseTable):
    class Meta(BaseTable.Meta):
        table_name = "EcommerceTable"

    id = UnicodeAttribute(hash_key=True)
    name = UnicodeAttribute()
    description = UnicodeAttribute()
    created_at = NumberAttribute()
    updated_at = NumberAttribute()
