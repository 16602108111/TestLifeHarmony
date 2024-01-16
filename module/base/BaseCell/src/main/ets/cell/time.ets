
// 获取13位时间戳
export function timestampMs(): number {
  const date = new Date();
  const timestamp = date.getTime();
  return timestamp;
}

export default {
  timestampMs,
}