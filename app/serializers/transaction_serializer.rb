class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :kind, :date, :description
end
