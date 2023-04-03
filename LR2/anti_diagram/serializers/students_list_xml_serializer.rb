# require 'xmlsimple'
# require_relative 'students_list_serializer'
#
# class StudentsXmlSerializer < StudentsListSerializer
#   def serialize(data, filename)
#     xml = XmlSimple.xml_out(data.map(&:to_hash), root_name: 'students')
#     File.write(filename, xml)
#   end
#
#   def deserialize(filename)
#     xml = File.read(filename)
#     data = XmlSimple.xml_in(xml, force_array: false)
#     data['student'].map { |student| Student.from_hash(student) }
#   end
# end