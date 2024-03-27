import 'dart:convert';

getApiData(){
  return json.decode(apiDatas['answer']!);
}

getCountries(){
  return json.decode(apiDatas['countries']!);
}

Map<String,String> apiDatas = {
  'answer':'[]',
  'countries':'[]'
};
