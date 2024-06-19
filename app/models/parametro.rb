class Parametro < ApplicationRecord
    def diagnosticar
      case @grado_de_tumor
      when 'bueno'
        if @higado == 'si'
          if @abdominal == 'si'
            if @peritoneum == 'si'
              if @pulmon == 'si'
                return 'estomago'
              else
                if @piel == 'si'
                  return 'rinion'
                else
                  case @edad
                  when '<30'
                    return 'pulmon'
                  when '30-59'
                    return 'colon'
                  when '>=60'
                    return 'pancreas'
                  end
                end
              end
            else
              if @pulmon == 'si'
                return 'prostata'
              else
                return 'estomago'
              end
            end
          else
            case @tipo_histologico
            when 'epidermoide'
              return 'pulmon'
            when 'adenoide'
              if @pulmon == 'si'
                return 'pulmon'
              else
                case @edad
                when '<30'
                  return 'colon'
                when '30-59'
                  if @peritoneum == 'si'
                    return 'pancreas'
                  else
                    return 'estomago'
                  end
                when '>=60'
                  if @peritoneum == 'si'
                    return 'estomago'
                  else
                    return 'recto'
                  end
                end
              end
            when 'anaplasico'
              return 'pulmon'
            end
          end
        else
          if @cuello == 'si'
            if @hueso == 'si'
              if @pleura == 'si'
                return 'glandulas salivales'
              else
                case @tipo_histologico
                when 'epidermoide'
                  if @piel == 'si'
                    return 'pulmon'
                  else
                    return 'glandulas salivales'
                  end
                when 'adenoide'
                  return 'prostata'
                when 'anaplasico'
                  return 'pulmon'
                end
              end
            else
              case @edad
              when '<30'
                return 'pulmon'
              when '30-59'
                if @pulmon == 'si'
                  return 'cabeza y cuello'
                else
                  if @pleura == 'si'
                    return 'cabeza y cuello'
                  else
                    return 'cabeza y cuello'
                  end
                end
              when '>=60'
                return 'cabeza y cuello'
              end
            end
          else
            if @peritoneum == 'si'
              if @hueso == 'si'
                return 'rinion'
              else
                if @abdominal == 'si'
                  return 'estomago'
                else
                  if @supraclavicular == 'si'
                    return 'estomago'
                  else
                    return 'colon'
                  end
                end
              end
            else
              case @edad
              when '<30'
                return 'rinion'
              when '30-59'
                if @abdominal == 'si'
                  if @hueso == 'si'
                    return 'esofago'
                  else
                    if @madiastino == 'si'
                      return 'estomago'
                    else
                      return 'estomago'
                    end
                  end
                else
                  if @supraclavicular == 'si'
                    return 'pulmon'
                  else
                    if @madiastino == 'si'
                      if @hueso == 'si'
                        return 'rinion'
                      else
                        return 'estomago'
                      end
                    else
                      if @pulmon == 'si'
                        return 'rinion'
                      else
                        case @tipo_histologico
                        when 'epidermoide'
                          return 'pulmon'
                        when 'adenoide'
                          if @axilar == 'si'
                            return 'pulmon'
                          else
                            if @piel == 'si'
                              return 'pulmon'
                            else
                              if @pleura == 'si'
                                return 'pulmon'
                              else
                                return 'rinion'
                              end
                            end
                          end
                        when 'anaplasico'
                          return 'pulmon'
                        end
                      end
                    end
                  end
                end
              when '>=60'
                if @abdominal == 'si'
                  return 'prostata'
                else
                  if @hueso == 'si'
                    return 'prostata'
                  else
                    return 'rinion'
                  end
                end
              end
            end
          end
        end
      when 'intermedio'
        if attributes[:cuello] == 'si'
          if attributes[:axilar] == 'si'
            'tiroides (1/0)'
          else # axilar == 'no'
            if attributes[:supraclavicular] == 'si'
              if attributes[:hueso] == 'si'
                'pulmon (1.15/0.15)'
              else # hueso == 'no'
                if attributes[:pulmon] == 'si'
                  'pulmon (1/0)'
                else # pulmon == 'no'
                  'prostata (1/0)'
                end
              end
            else # supraclavicular == 'no'
              case attributes[:tipo_histologico]
              when 'epidermoide'
                'cabeza y cuello (5.59/0)'
              when 'adenoide'
                'tiroides (0.15/0)'
              when 'anaplasico'
                'pulmon (0/0)'
              end
            end
          end
        else # cuello == 'no'
          if attributes[:pleura] == 'si'
            case attributes[:edad]
            when '<30'
              'estomago (0.15/0)'
            when '30-59'
              if attributes[:madiastino] == 'si'
                'pulmon (0.59/0.44)'
              else # madiastino == 'no'
                'testiculos (1.59/0.59)'
              end
            when '>=60'
              if attributes[:pulmon] == 'si'
                'rinion (0.15/0)'
              else # pulmon == 'no'
                if attributes[:abdominal] == 'si'
                  'colon (1.3/0.3)'
                else # abdominal == 'no'
                  'higado (1/0)'
                end
              end
            end
          else # pleura == 'no'
            case attributes[:tipo_histologico]
            when 'epidermoide'
              'pulmon (1.76/0.44)'
            when 'adenoide'
              case attributes[:edad]
              when '<30'
                'rinion (0.56/0.12)'
              when '30-59'
                if attributes[:peritoneum] == 'si'
                  'estomago (0.42/0.27)'
                else # peritoneum == 'no'
                  if attributes[:pulmon] == 'si'
                    'pulmon (1.01/0.71)'
                  else # pulmon == 'no'
                    if attributes[:axilar] == 'si'
                      'pulmon (0.15/0)'
                    else # axilar == 'no'
                      if attributes[:cerebro] == 'si'
                        'estomago (0.15/0)'
                      else # cerebro == 'no'
                        if attributes[:hueso] == 'si'
                          if attributes[:madiastino] == 'si'
                            'pulmon (0.3/0.15)'
                          else # madiastino == 'no'
                            if attributes[:abdominal] == 'si'
                              'esofago (0.15/0)'
                            else # abdominal == 'no'
                              if attributes[:piel] == 'si'
                                'pulmon (0.12/0)'
                              else # piel == 'no'
                                'prostata (2.86/0.56)'
                              end
                            end
                          end
                        else # hueso == 'no'
                          'estomago (0.56/0.3)'
                        end
                      end
                    end
                  end
                end
              when '>=60'
                'estomago (1.18/0.59)'
              end
            when 'anaplasico'
              'pulmon (0/0)'
            end
          end
        end
      when 'grave'
        if attributes[:pleura] == 'si'
          case attributes[:tipo_histologico]
          when 'epidermoide'
            if attributes[:edad] == '>=60'
              'pulmon (2.01/1.19)'
            else # edad != '>=60'
              'pulmon (0.71/0.31)'
            end
          when 'adenoide'
            if attributes[:abdominal] == 'si'
              'colon (0.3/0.15)'
            else # abdominal == 'no'
              'pulmon (1.01/0.19)'
            end
          when 'anaplasico'
            'pulmon (1.01/0.03)'
          end
        else # pleura == 'no'
          if attributes[:abdominal] == 'si'
            if attributes[:mama] == 'si'
              'mama (1/0.03)'
            else # mama == 'no'
              'colon (1.15/0.59)'
            end
          else # abdominal == 'no'
            case attributes[:tipo_histologico]
            when 'epidermoide'
              if attributes[:edad] == '<30'
                'pulmon (0.59/0.12)'
              else # edad != '<30'
                'pulmon (1.59/0.71)'
              end
            when 'adenoide'
              if attributes[:madiastino] == 'si'
                if attributes[:edad] == '>=60'
                  'pulmon (1/0.59)'
                else # edad != '>=60'
                  if attributes[:cerebro] == 'si'
                    'pulmon (0.44/0.15)'
                  else # cerebro == 'no'
                    if attributes[:hueso] == 'si'
                      'pulmon (0.42/0.27)'
                    else # hueso == 'no'
                      'pulmon (0.15/0)'
                    end
                  end
                end
              else # madiastino == 'no'
                if attributes[:edad] == '<30'
                  'pulmon (0.56/0.12)'
                else # edad != '<30'
                  if attributes[:peritoneum] == 'si'
                    'pulmon (0.27/0.15)'
                  else # peritoneum == 'no'
                    if attributes[:mama] == 'si'
                      'mama (0.71/0.44)'
                    else # mama == 'no'
                      if attributes[:piel] == 'si'
                        'pulmon (0.31/0.12)'
                      else # piel == 'no'
                        'colon (1/0.59)'
                      end
                    end
                  end
                end
              end
            when 'anaplasico'
              'pulmon (0.59/0.15)'
            end
          end
        end
      end
  end
end
