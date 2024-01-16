
import cryptoFramework from "@ohos.security.cryptoFramework"


function stringToDataBlob(str): cryptoFramework.DataBlob {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  var unit8Array = new Uint8Array(arr);
  const res: cryptoFramework.DataBlob = { data: unit8Array}
  return res;
}

export function md5(str: string): Promise<string> {
  return new Promise((resolve, reject) => {
    try {
      var md = cryptoFramework.createMd("MD5");
      const blobData = stringToDataBlob(str)

      md.update(blobData, (err,) => {
        if (err) {
          reject(err);
        }
        md.digest((err1, mdOutput) => {
          if (err1) {
            console.error("[Callback] err: " + err1.code);
            reject(err1);
          } else {
            console.error("[Callback]: MD result: " + mdOutput);
            let resStr = mdOutput;
            resolve('')
          }
        });
      });
    } catch (error) {
      // console.error("[Promise]: error code: " + error.code + ", message is: " + error.message);
      reject(error);
    }
  })
}

export default {
  md5
}