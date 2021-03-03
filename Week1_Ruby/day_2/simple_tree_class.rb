#!/usr/bin/env ruby
# frozen_string_literal: false

# Simple tree class
class Tree
  # attr_accessor: определить переменные класса children и node_name
  attr_accessor :children, :node_name

  # Метод инициализации объекта
  # @param tree [hash] -  дерево с потомками
  def initialize(tree = {})
    @children = []
    @node_name = tree.keys.first
    tree[@node_name].each { |parent, child| @children.push(Tree.new(parent => child)) }
  end

  # Пройти по всем узлам дерева
  # Для каждого элемента дерева будет выполнен метод visit
  # @param [Tree] - дерево или его часть
  def visit_all(&block)
    # Зайти в элемент
    visit(&block)
    children.each { |child| child.visit_all(&block) }
  end

  # Зайти в элемент
  def visit
    yield self
  end
end

ruby_tree = Tree.new('grandpa' => { 'dad' => { 'child1' => {}, 'child2' => {} }, 'uncle' => { 'child3' => {}, 'child4' => {} } })
puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
puts
puts 'Visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }
