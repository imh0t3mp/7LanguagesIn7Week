#!/usr/bin/env ruby
# frozen_string_literal: false

# Simple tree class
class Tree
  # attr_accessor: определить переменные класса children и node_name
  attr_accessor :children, :node_name

  # Метод инициализации объекта
  # @param name [String] - имя элемента
  # @param children [Array] - список дочерних узлов
  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  # Пройти по всем узлам дерева
  # Для каждого элемента дерева будет выполнен метод visit
  # @param [Tree] - дерево или его часть
  def visit_all(&block)
    # Зайти в элемент
    visit &block
    children.each { |c| c.visit_all &block }
  end

  # Зайти в элемент
  def visit
    yield self
  end
end
ruby_tree = Tree.new('Ruby',
                     [Tree.new('Reia'),
                      Tree.new('MacRuby')])
puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
puts
puts 'visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }
