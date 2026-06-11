Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011034.outbound.protection.outlook.com [52.103.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7835893
	for <sophgo@lists.linux.dev>; Thu, 11 Jun 2026 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157689; cv=fail; b=pSyQ5HgfV0GqEpJaBrRnT/f3f5wrOc8fto+uBC4Lz/Ex65N6JkRplmfUEs6PWmve/rBP63aVelpyH92dj6cux6q7KoCqJpgQYkdFoCGrda8IkD1J41I+k1PABE7zReMZ09Fu+CqCZd0n+gZvBS2ZRJnD9FXUgbE0qRKAiXLAMx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157689; c=relaxed/simple;
	bh=S+pAyHPSS0p3cHatco/BY7ldJMiuuZBM2tV2YHJldCI=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=goYFSUaJPtabSPb6iE8j4xsrv1ycEL8oLU9QcjZmyAvEK3LsoinNwojxv/CmZ+Orrd1HQ1qCkJ9se5qxkXSTae7lv7mB592qX7B3TYNYjjqqc5em3dBveav1u4j2M/6PvSM+Pk8iO7ZHtAxmljwtZyNMUaMDkrljN5LrXzsunHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=s2aw6O/d; arc=fail smtp.client-ip=52.103.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="s2aw6O/d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5R8rZMQV0k4u41XCr1Dlbh+IuppcHnGuZvsoP2saeNuhp5qwi/lni7dQY8zzzhMm9I2mkXHT/wWa6LqyUN/fD8N/pkzu+u8NpeZaLz7N2ChqiNWDceI2oypXZMWAn/DeyiqwhydOgNEjD+KsJgR9XMi9P5acjlnhtG08PbQohsDl0pNx975uaIxDReSK+1NK19/9aFLZ9M+F9zMfSBTrEqrcM1HNLjVByNFgI1vWWRMnoO9JqXOUoPVxJQWcN6lh4blURKzXYLJII5FeJ3I08pl6RnW17hyJgfjuuTnc81SbyBT16vqMz+d8xIN3AR3EIoV+sVfatCQ7is+uDqZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGpnEmMzUx5NO3wOYhsQ5heU7Vos+Ro4ZwvqWW7aBOc=;
 b=yZMOAoTL1DipLdWOhujjzCB9ooHPHsIByZa742PoolKiEhuAgHkV5jsa4d8ZcH2gdwd7PcHtDC/IQ6RjyGl+cV9PWkR9mLY6r6SsVagriqOFOrqz1/yxALJfhbgfA2TaNGEDImvJyzdL2ENbkNiX9a1k1uobgNKeIjuHJVYRvJi04RDdKy6Xs+I9nYPTHzK2Uav119LI4QfbAAae6pvdzWw4NBg9pq+jeN9OXrHuRhQC+6gtcAfJx36WOy/xOYvjkeK9TCvVZDOQOFCmhXtCEQV/egzrzMTsradBvY+BwhCeZBLc3MLBvQGzOlJr5kzM77j+4HX7puP3rAXlwc6PVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGpnEmMzUx5NO3wOYhsQ5heU7Vos+Ro4ZwvqWW7aBOc=;
 b=s2aw6O/dasuxRPBGiPAXqLZTUavrXIIS0LZXNT9TLCgNnTM9j+NoqJOOa96ANH9GWkAUmbuNNNidQ8Pvwpi0XrPVp8zMvrVt5jWzN6CxKWsS9drQZFMNacFSoVbcly+nkgQb9S7YuC9Fqh/tzIXJd66AHAw4kLi65vzVR6aJjrox+N5AjHGpYzTR3V1Ya6hP7RPjSUAq48kL5rYih4XCm3cGb3gyYNJchkpzRtHh0PIYPfz9iSp37RunmBpBE/Top77AndMi4D2YkWBtNLVFvuq3oe0cEjl9fx0K6JOu9/ZMwimtQG2J3xIj+yN11Nq4TTfF2sVfAsVx6VFQJGErrw==
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:230::5)
 by MA5P287MB6057.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 06:01:21 +0000
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73]) by MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 06:01:21 +0000
Message-ID:
 <MA5P287MB6080425FD7739B6126DCA7C6FE1B2@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 11 Jun 2026 14:01:16 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/11/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0089.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::15) To MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:230::5)
X-Microsoft-Original-Message-ID:
 <17a36822-2da5-4a63-8e58-9ad8996f0f5b@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB6080:EE_|MA5P287MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: b501c3a2-f8bd-4677-7685-08dec77edb78
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|24121999003|25031999004|6090799003|5072599009|8060799015|8022599003|24021099003|15080799012|22402599018|23021999003|19110799012|4302099013|3412199025|440099028|1602099012|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjNhVzh2OUpmdTJEa3FlYm01bUsvWHBkSDVSQWpYcXp1cFNYT2JPemNRYVZm?=
 =?utf-8?B?TXI1Y29pVnFrMVAyQmxiUXFJMkZWdG9HVUFyMFV5b0UveVl6ZmV2RWhYSWJj?=
 =?utf-8?B?b0ZTWUFhM1pwS0NRMXFmVWF5V2NQdXF4a21tRXhxZG9sSWZiM1ErWmJGU0ht?=
 =?utf-8?B?RGowbktIRzJVVTBpM3VrWjE5eXNTVXRPczgyNkViT0ZhVERRRDdPSDhQSHJX?=
 =?utf-8?B?b0xLWGhuTC9rRVpnRU5sVXZ1TXBMUWlCTmRCcFN5RTI0MnI0b3FoWE1HYkF5?=
 =?utf-8?B?QmZ4bDMyN0V6SEhXV3dDOE02amZtZWZCMVF1YW1ONEM0cjZ6SUlZTlJxVk0z?=
 =?utf-8?B?V0hLczVCV3diVFJxTk9JTXpUWkFGQkEraDBwTmpFenBPNVNnaE54MXJmN1VQ?=
 =?utf-8?B?TEl4Z2FXZVU0Q0szN1YvbVB2ZWw4TkF5RHZSZS9MMTR3NWpock1mTHpZa1Bz?=
 =?utf-8?B?L0dDcDk4V0hEL1RnaTBEUVlPRmtVbjBGdGZ4empQT1hKaGsyTE1YSURJY3lu?=
 =?utf-8?B?c1BMRDdLcC8vWlhqcTAvSlMrL1llSzNJUC84NXlXai9jdFJTRzRDcVlVVEx4?=
 =?utf-8?B?M1phMk1hWmlmc05xQXlHT2lXR1psMTlVSHZDVTcvR1FlbDJXbHM0UjgzS1NR?=
 =?utf-8?B?SUh3emJHdmVoTXo3d1lrVDdIcXNnem9kV2k1NEVWcE1hY2NFNmhjYTBEVENm?=
 =?utf-8?B?eHhsakdGYUlLS0JvT1FkOEhYMm9IZ01hc3hRWWlTT0xxTzZiUFJSUThrOFNF?=
 =?utf-8?B?WGhZK3k2NnZWb0U5ZXh4VVhwMEVDTnpCNWx0dEw0RDdHTUtWWHlxS21Qc2k0?=
 =?utf-8?B?b09lZER0Y0t4QnBBR0pDNWdUWVdWc1VhS2Nxbm9oZHE1MFYrZmV3SCtXaENu?=
 =?utf-8?B?cHNYV3dRbnVPOStCRkxNckZ6cFRvT2l1U21XZk1ZYXFBTDdnNTFHU1p3V2Fz?=
 =?utf-8?B?VnVnNDVJcmdIVWFnbjRMZEVTczFVY2lSRGtVTC9WTG9FeU5XQzcrZGVaTS9Z?=
 =?utf-8?B?TFVhWHJUTlRBU2M2d0l5RFA2ZnhIOG1OUmZHTHkwWnEzZnlaVWlmN09JTE0v?=
 =?utf-8?B?dWRMNHNNQjgzRURCK0dxYkdBT2NjRnAyV2E0VGhtc0dNQWlDRFRDZXczb3Nt?=
 =?utf-8?B?UFZYV3dZVUZKTGVQZkVLV1dkdkZQVjVvRGdGekl3Ykowc3o3NmZXcytYKzNV?=
 =?utf-8?B?elpTNTg1d3RSaUFjMWZSQ2VrekZpVm1oVGVGeWZPdmlYTk9mWTV6MUc1aDBM?=
 =?utf-8?B?bWpwNFJ1MWppZmtzbXhLNzIzeklHQTk1OW5MUFJrNnh1Y240SkRBMUQreXpH?=
 =?utf-8?B?bjcrZUxyOXVCUjNpOTlYNkpjV01uZ0EveGpRWXZUcFplcjhCMisvdXJJNmFn?=
 =?utf-8?B?ZGVrSTBSTStjOVdVQng3YTc4U1NoSnIzRmZ5VTdPRGlKQVQvN283eElHMXMy?=
 =?utf-8?B?NjZGWEdQa2N2WjlZL2RTdE1WQUFCa1FsRlhjb0RHSGw0N3JGc09xUG5xRFc2?=
 =?utf-8?Q?v5MoxGQaB6bu1efrCqbsGDu6Kfj?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE92NHhmNzBiVEF3VkM1WTdQWmFpWDJMUE5Ibm9DdER4S3BZOGg2R1Y5bmVJ?=
 =?utf-8?B?eHQ4OG83MExKVTJJZkFwbDhJcnA0VDhldlA3ZjZielkwRXRwaHRodno1ajhI?=
 =?utf-8?B?OHdLcXBiSEZiMnFEdjZLT3A1TGFycXV3eXV1TFBXemc2VGxaSjByVmExVGtT?=
 =?utf-8?B?enB3L1lNQTRPVGEvMlVWVnE0RVhCTGx0Z01MSDdvRHFBMk4rSG12K05tQmRU?=
 =?utf-8?B?bUZNbi90OVBMeE91TCtWS1FWeGI1VmpUOW5QblhBeG5UaWFVUkR2VDkva3NN?=
 =?utf-8?B?K1BaejVoeWdWV0ZPSFJaRTFVbmtHN3lma24zcUQrVmJTK0hJQW9XY3NQSnNK?=
 =?utf-8?B?NTEyalkzdldyYnpiZW81ay9aU2NEU0RrV3RQdFQrcFRmdnFSVmJ6ZUk1cmo2?=
 =?utf-8?B?Ui95ZDJqdG01M0tsSDJ6N3NMNVoydkQ4OVRabkhOQnRBTkJYaWpNTUFPUTJJ?=
 =?utf-8?B?dGdnV1NnV2tpMVJ6a2UzdEw3ZXZ3R2c1SlNpVzIyTWVTdk51UnRjdTUxNkRC?=
 =?utf-8?B?UzYvajhrdkNibDgwL1loVkd6RndZSjYxWGUyK0F0bzU1cW4rSUduWlFobXo3?=
 =?utf-8?B?M0hxVVNNNXJPY3NIdFJLVFRCQ3ZmUkxTQ3Q5Mmd3WjVYRlJPY3NseG45V0Zu?=
 =?utf-8?B?OXFQTFcxWEpuRVM5a0dhSjk5dEc5N3dWTCtSbVVtaEo5cEY2SmVEMllCcG5j?=
 =?utf-8?B?b0RMZzFIMW0zNUJuZlZBVWllaHJaeG1xMm9GcFhtMVpDbUg5dndtSWpwRXRM?=
 =?utf-8?B?NTd4bHIrcjB0Tlc2MnU4eVdvamZ1bU1OU1dCNUowcEtKd042bGhzYzUybG5w?=
 =?utf-8?B?YXZlYm9sWFdueWVQNWJoNnZYSTdiS01lRFZpS05MeXUwRXkxSHB6Qk0vU2ht?=
 =?utf-8?B?cjZCaUpUL0xKbHV0ejl3MGVQRi8vWkdzZGlzWXprTlpBTytKL2NXdVdNc2Yw?=
 =?utf-8?B?TWxqRGlBR2g2K1lTMWQ2L0Rxc3JWdFRydlQ2VjJEZnZidTExYStDbHk2cGtT?=
 =?utf-8?B?bTY5MG4vQWVYY3BmL2gzOE9VUmlrZkJnYXJPN2RLSWU5dGx2SFpkMTlITVNH?=
 =?utf-8?B?MTJ4RXhzOFNpV3QyK3czTVhJeG5RQVdVWjRvSVdLb1dMUmFZUTNseHR0dldW?=
 =?utf-8?B?WDFRNU1wYm5EUURMb2h0UStrWjRwQjNnSGxYRGdvcTJVYmMxL3Zma1lDL2k1?=
 =?utf-8?B?cUxjNlJ5d090ZVZMOWsvRDJDTkRJbjJBbTNXMXREazFub1dsZzlZZzJyU0dh?=
 =?utf-8?B?Yzc5Q014N1RwS050bmJ1M0dyYlk3SzUwVWFDdHFIeHYrd01jcFUrR2NwVUVk?=
 =?utf-8?B?RXE4RnN4WXVYKzZmc3RUQjNDbVFrRHdXcUNQTklJTFR0MHlQdnVDT2RCdlNr?=
 =?utf-8?B?V2xuNDdpM0VMRWFZNFFFTGtqUVppNGZFYlM4eVcrVE5GS3BQSjM0bW82VTlP?=
 =?utf-8?B?Y09ybXFoSmZQeXVCV0ZtaStxRzlYUzFENWZWYjQ5dStQa2ZTVDdpVW52TzVH?=
 =?utf-8?B?Mk8wT3RyVHRWanl1ZXNEc0c4NGhPREVydngxalpvQktiOVgxaWFQaWtSRTJM?=
 =?utf-8?B?VWlvUk1WWnV4L3h4bisrM3FUZlpMS1NCdEVlckdzajB5VFYxdFkvMzB4b1VY?=
 =?utf-8?B?NmRYSVhENFZES2srbzVyajNobkdnUHltUXdFZzhBVnREQzhINDB0eG5vMmx6?=
 =?utf-8?B?b1g2NDRxVTZDc3NsWXFwNEdqQ3N5WmRYNEtzMUJZdDZ0WGczUlh6bG5MODhY?=
 =?utf-8?B?MkJReUhqWkpUNDB3UU84U3RVM1d6cFBBdjJFTDVWYXY4eFVBaUtnMWxnRmgr?=
 =?utf-8?B?UmNwVFVmWThIWWZmV3VOZC9YelVKUkVqbklQRU9Td0cxWU85dEt5MFYzdi8w?=
 =?utf-8?B?c2VVL3M4SWZ1SkZPZitYb2Z0VUhmOENkbTVuY0RmQkJIRVNqWGFJbGRaWVdq?=
 =?utf-8?Q?jeJ6uqps/zz1BU3SGhHyZz6SEoCY8bQf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b501c3a2-f8bd-4677-7685-08dec77edb78
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 06:01:20.7730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB6057

Linux Upstream Status updated: Jun/11/2026 
@https://github.com/sophgo/linux/wiki

CV18xx:
- Duo 256M support: New support, updated to v2.

SG2042:
- N/A.

SG2044:
- Add Zic64b ISA extension: updated to v3

Thanks,

Chen

