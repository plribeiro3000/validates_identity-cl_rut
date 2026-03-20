# frozen_string_literal: true

require 'validates_identity'
require_relative 'cl_rut/version'

class ValidatesIdentity
  module ClRut
    autoload :Validator, 'validates_identity/cl_rut/validator'
  end
end

# Person and Legal
ValidatesIdentity.register_legal_identity_type('CL_RUT', ValidatesIdentity::ClRut::Validator)
ValidatesIdentity.register_person_identity_type('CL_RUT', ValidatesIdentity::ClRut::Validator)
ValidatesIdentity.register_legal_identity_type_alias('CL_RUT', 'CL_RUT_LEGAL')
ValidatesIdentity.register_person_identity_type_alias('CL_RUT', 'CL_RUT_PERSON')
ValidatesIdentity::ShouldaMatchers.register_legal_allowed_values('CL_RUT_LEGAL', %w[760864285 76.086.428-5 220604497 22.060.449-7])
ValidatesIdentity::ShouldaMatchers.register_legal_disallowed_values('CL_RUT_LEGAL', %w[76086428K 76.086.428-K 220604492 22.060.449-2])
ValidatesIdentity::ShouldaMatchers.register_person_allowed_values('CL_RUT_PERSON', %w[125319092 12.531.909-2 85490923 8.549.092-3])
ValidatesIdentity::ShouldaMatchers.register_person_disallowed_values('CL_RUT_PERSON', %w[12531909K 12.531.909-K 85490921 8.549.092-1])
