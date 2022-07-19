
from pipes import Template
import simplejson


file = open('a.json',"r")

str1= file.read()

file.close()

def strCov(s: str,firstSingularize = False) -> str:
    res  =  [ x.capitalize() if i!=0 or firstSingularize  else x for i,x in enumerate(s.split('_'))] 
    return ''.join( res)




sj = simplejson.loads(str1)

keepdict={}


def traverse(d,s:str="Abc"):
    if type(d)== dict:
        keepdict[s] = d
        for key, value in d.items():
            if type(value) == dict:
                traverse(value,strCov(key,True))
            elif type(value) == list:
                if type(value[0]) == dict:
                    traverse(value[0],strCov(key,True))

traverse(sj)





class ParseDict:

    def __init__(self,jsonMap:dict,className:str = "Abc",prefixPath:str="abc"):
        self.className = className
        self.prefixPath = prefixPath
        self.jsonMap = jsonMap
        self.propTypeList = []
        self.propRawNameList = []
        self.propNameList = []
        self.result = f"import 'package:equatable/equatable.dart'; \n\n\n\n class {self.className} extends Equatable {{\n\n"
        self.geenrate_property()
        self.generate_constractor()
        self.generate_fromJson()
        self.generate_toJson()
        self.generate_copywith()
        self.generate_stringfy()
        self.generate_equalFun()
        self.g_close()

    def geenrate_property(self):
        for key, value in self.jsonMap.items():
            self.propRawNameList.append(key)
            self.propNameList.append(strCov(key))
            if type(value) == bool:
                self.propTypeList.append('bool')
                self.result += f"final bool? {strCov(key)};\n"
            elif type(value) == dict:
                self.propTypeList.append(strCov(key,True))
                self.result += f"final {strCov(key,True)}? {strCov(key)};\n"
            elif type(value) == int:
                self.propTypeList.append('int')
                self.result += f"final int? {strCov(key)};\n"
            elif type(value) == str:
                self.propTypeList.append('String')
                self.result += f"final String? {strCov(key)};\n"
            elif type(value) == float:
                self.propTypeList.append('double')
                self.result += f"final double? {strCov(key)};\n"
            elif type(value) == list:
                self.propTypeList.append(f'List<{strCov(key,True)}>')
                self.result += f"final List<{strCov(key,True)}>? {strCov(key)};\n"
    
    def generate_constractor(self):
        self.result += f"\n\n const {self.className}({{\n"
        for key in self.propNameList:
            self.result += f"this.{key},\n"
        self.result += f'}});\n\n'
    
    def generate_fromJson(self):
        self.result += f"\n\n  factory {self.className}.fromJson(Map<String, dynamic> json) =>\n {self.className}(\n"
        for i, x in  enumerate(self.propNameList):
            jkey = self.propRawNameList[i]
            jtype = self.propTypeList[i]
            self.result += f"{x}: json['{jkey}'] as {jtype}?, \n"
        self.result +=f");\n\n"

    def generate_toJson(self):
        self.result += f"\n\n Map<String, dynamic> toJson() => {{\n"
        for i, x in  enumerate(self.propNameList):
            jkey = self.propRawNameList[i]
            self.result += f"'{jkey}': {x}, \n"
        self.result +=f"}};\n\n"
    
    def generate_copywith(self):
        self.result += f"\n\n {self.className} copyWith({{\n"
        for i, x in  enumerate(self.propNameList):
            jtype = self.propTypeList[i]
            self.result += f"{jtype}?  {x}, \n"
        self.result +=f"}}) => \n {self.className}("
        for i, x in  enumerate(self.propNameList):
            self.result += f"{x} : {x} ?? this.{x}, \n"
        self.result +=f");\n\n"

    def generate_stringfy(self):
        self.result +=f"@override \n bool get stringify => true;\n\n"

    def generate_equalFun(self):
        pros = ','.join(self.propNameList)
        self.result +=f"@override \n  List<Object?> get props => [{pros}];\n\n"

    def g_close(self):
        self.result +=f"}}"
        file = open(f"{self.prefixPath}/{self.className}.dart", 'w+')
        file.write(self.result)
        file.close()

for k,v in keepdict.items():
    ParseDict(v,k)
            











