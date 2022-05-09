import React from 'react';
import { SafeAreaView, Text, Button } from 'react-native';
import ZipArchive from 'turbo-zip-archive';
import RNFetchBlob from 'rn-fetch-blob';
import { unzip } from 'react-native-zip-archive';

const App = () => {
  const dirs = RNFetchBlob.fs.dirs;
  const fromPath = dirs.DocumentDir + '/artifacts.zip';

  const unzipNowTurbo = () => {
    var t0 = performance.now();
    const path = ZipArchive.unzip(fromPath, dirs.DocumentDir, 'UTF-8');
    var t1 = performance.now();
    console.log(`Unzipped in ${t1 - t0} milliseconds.`);
  };

  const unzipNow = () => {
    const fileName = '/artifacts.zip';

    const source = dirs.DocumentDir + fileName;
    const destination = dirs.DocumentDir;

    var t0 = performance.now();
    unzip(source, destination).then((res) => {
      var t1 = performance.now();
      console.log(`Unzipped in ${t1 - t0} milliseconds.`);
    });
  };

  console.log('dirs', dirs.DocumentDir);
  return (
    <SafeAreaView>
      <Text>{ZipArchive.getGreeting('Roshan')}</Text>
      <Button title="Unzip Turbo" onPress={unzipNowTurbo} />
      <Button title="Unzip Async" onPress={unzipNow} />
    </SafeAreaView>
  );
};

export default App;
