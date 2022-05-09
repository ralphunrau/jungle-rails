require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context 'with all required fields filled out' do
      it 'should validate all' do
        @category = Category.create(name: 'Cars')
        @product = @category.products.create({
          name:  'Honda Accord',
          quantity: 5,
          price: 19999.99
        })
        expect(@product.errors.full_messages).to eq([])
      end
    end

    context 'without price' do
      it 'should error out' do
        @category = Category.create(name: 'Cars')
        @product = @category.products.create({
          name:  'Honda Accord',
          quantity: 5
        })
        expect(@product.errors.full_messages).not_to eql([])
      end
    end

    context 'without quantity' do
      it 'should error out' do
        @category = Category.create(name: 'Cars')
        @product = @category.products.create({
          name:  'Honda Accord',
          price: 19999.99
        })
        expect(@product.errors.full_messages).not_to eql([])
      end
    end

    context 'without category' do
      it 'should error out' do
        @product = Product.create({
          name:  'Honda Accord',
          quantity: 5,
          price: 19999.99
        })
        expect(@product.errors.full_messages).not_to eql([])
      end
    end

    context 'without name' do
      it 'should error out' do
        @category = Category.create(name: 'Cars')
        @product = @category.products.create({
          quantity: 5,
          price: 19999.99
        })
        expect(@product.errors.full_messages).not_to eql([])
      end
    end
  end
end
