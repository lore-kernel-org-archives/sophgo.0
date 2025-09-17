Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1E2AD02
	for <sophgo@lists.linux.dev>; Wed, 17 Sep 2025 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097157; cv=fail; b=LbC3B33yFW5MFY/p0+BHCUvzT8tPUk1yCGGeWLFiCUmL6vOjZ8vDRtiH8Z/Tit4QtEaFMZn/tyhNS1L0HHlUT9QriekaT4l0/iG6C2pJwhaIQYiTDdrt9kzfyhy4GOX+kMzKtpDxq711s3y62H48VTlKGKXaMF0bxiLsT9LS6Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097157; c=relaxed/simple;
	bh=S6234mvpAhtADV5YCJlzzgbAoZM7ZbCC9Arg78fJbZw=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=pGCLntZiO1T5lOknGEhs8AoKKinZukggzBH9FnFI87BmkApGntrmohvlbNpGVVJJMCa7WwX4JEGfqeFXAQ1uhVLKFQ9OBEj3XdLmZbJJIy1Hq6qlFPCVx8oiAbX0ahR9k5dYF6+lch0s97TvDspOCJJmSY1ChcCKaX8Vy+ofuBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=SwK5wO61; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SwK5wO61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnygESf1J6kzA+4kyiGAs4xpK5F/L3Gz393AfiiP8kPunc7c8ArkyYiGIG4ZBAWG2hyZMM3ovdRfZSaReRScjVp+GdwcMbyidoXvEQO53Ry+W8xaaxuX9VNUcOZXXWxv6qXDh6ECrlHidjez2be0jiTUufIdZmVvJbXz6yLZ0oQwwhmd6wxYIIXEIQHYqDnxAvoRL+kB/ZqRDgsFKWjbu92mEaiX3+DnIHE3efFnwzJDNJaRJFPzgQV5IhL3Eo7weKxfCt1vGteTDRrbg5tIQIGoIsr3bsIsARv7tt4MpFcxecXcO4kK8EKkoGJV5v41ekApbQD/q8spf/+WalHXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ke6pdNnxKm6nLHnQH/2LpRWTGPQECZwRyCgcCrWv7Io=;
 b=cyVd6/VDsmYxJtzUfkOjlZA7lA4MBgy3M2oBFTuHkORdXqLAhED7d4j0VHcDuvNSkWb9uQWUuvCvxpAvDxjpujER/CKgrVUYgh1dluecl1/HkxnJkDGuH1n+shr+zTg/V1S1W4kQavsJLD2dYMs5QEyBqoeg9+/RIY2FzJKyLN2Bef0bEPUZHasL549kkVJEoiT06zOieG89WXdV83XojG9+AMeBRiyY6jLLOJqV+JlJoksAGKYxNbhvxq7ANroc6OVXytvA1M/yjynyKAUmNUBrqEs8EOOpeet5BtsCergrQhJriAk/uXv8Bo883P4T40JZvREOsN9flfiZhoxrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke6pdNnxKm6nLHnQH/2LpRWTGPQECZwRyCgcCrWv7Io=;
 b=SwK5wO61YNqCDopbbqh6zSRbfVq8F1iusbArlC5qlvBe1WVMn5BdWFjwjkXd6XcHE7+GK8M4jaBx+iiNmkNlzUoUiIMpo6b9VwU4fMmAlKSGEFQDhGVahFI0hm4x5Khj0N3wlzpWkYNR6svMSnOVmGDyHk+VXXLEShdk3DydBYD/RmBIH1H5jfnVfHwgTFa+gH/0b3V7rLTw6ceV3L7DFvqkuussAsbTCvHovbjHB+q9ZPzkhO3gHObTlZT3TizKqRywO3XC+HUiGT5iXqrVLRzvc4TYTVDhEK7rvF88tBl45Ok0lGO6zxkT6Vt04pDfCBC4jkiE7qNxPikTvWG9Qw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MA1PPF8BC6B51D4.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a04::9c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 08:19:10 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 08:19:09 +0000
Message-ID:
 <MAUPR01MB11072ABA02A18CC7AA9B88874FE17A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 17 Sep 2025 16:19:05 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <a31e67ec-67d6-47b7-963c-b6eda19fb271@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MA1PPF8BC6B51D4:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7cc647-50f5-4c98-369c-08ddf5c2e090
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoyTIwSrGph0lItVprk4CpiShduoEPlBfNgtmNiFizWmAK8OrsNXPD9OXhiSly5wfBLVVn0niH+hSVTMOuLBuMFP4Kp4SSIGDWgOLDaDXp/oXE/bpe9qReqQYaRnDeXs5yjgdYemJwtujqRBIJ/i5TDNCVCPXqYkpfFVrZ/WzBR4g17Avikt45RkECvy6P9MP+6qZ8EJykoFYabErqNZ1VWjrWnfEep7lAhFEtPjqGG3qcFoknGPNvR/Km0b4/W+TqMG0DjS39D1vtFcZ31Wf7sQjZXnd6Fo12NPC15UT2Yei32QksJWtVvoPhdHnOk8I/89flubXI443LXJOyCcc/ibjiQSijFAPBK9PHP8/viIchlwem0ngEWzVNgO1aZhFD5S/zgGS26Bezff6Jm+U2+N4PL/uVl7ZYdc/6gucy3tflaIDOugkRtHt2Jf90dDPMjWzSZjr8qioVZ8Hy+trc2jfhTxrmpvo2oDQpIN6Cm7fvPErTtO+dmUnvNTM7HDF/dnXulDKb+bs+zkB+LAkC73rLoWT7bNKnPmXv6BZ2UJNP5U5sghPQzPXL9ivnnEvsNkY4NPIn8GbX1BPs6LnpIvyVdKvx6JXtA0dLQV8H/4bpvBY0gfirLfhdroNfXYRKzfYx/tqDKXgCyHrKMnsypTlsnOexRMI3RUcCmshHQ/pvSD5csD+cD5hiQfa22pgXByKtpH15aJjbe/qnfviv/1krR6z6mPZrRK3gQU0LUqx6TzEX+X0prvykGKcMd/z4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|6090799003|5062599005|19110799012|461199028|23021999003|5072599009|15080799012|40105399003|52005399003|3412199025|440099028|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3dGVWtiWW9WTTQrdWNtcll5blhSTlg4OHo5cjR5cVFXYURyNVRhbTdQeElL?=
 =?utf-8?B?Mm0vajBsb0hkSElhaUY2V0ZvakxKN2xXWEE2Z1poQ1BLNkYvZHhIanE5Ynh2?=
 =?utf-8?B?a2ZuRFJrR3FlZG9aZERwNWdXSDJ2Y2Q0WFlIYjhOS2FuNUFFV1dvYTJ5M0RX?=
 =?utf-8?B?MzI0N3hIdEV3c09PSHpVZTRaN1ZYZ3lVc3dYRWc3TzB6c0RDN0tDU2hsbG9P?=
 =?utf-8?B?aUNyRWV1MTFEOU45NTJqamFpZWxnVC9jb24rZ1E2QmQ3cHFyMGRmYW5waXVK?=
 =?utf-8?B?anBhTlRJa1NIRDFpZVQ3QUJwNVFYYXFuS1hlRUIrOVFiV0FaQThMZkxGbUMx?=
 =?utf-8?B?bjgyRnBRUURaUitiZ2FoTlI2RUdsaytjSHhqZmg1YjNjVVRLVGRHekVRY3Uz?=
 =?utf-8?B?WTdYU3F5czB1NkhSVTROWDdYaytYeDR6L1NUa1FYWlVtNW5CbU9kSk9qM1ZS?=
 =?utf-8?B?TkR5eGtDRFdIRDZaUEtlSEtRN2ZpNlV4bWR2WmxaZVlRUUg1YlUzM2V4Vkw2?=
 =?utf-8?B?OWMrNkMveE1wUkRLSCtRRzQ4d3Q2STk5d2I1MHhCM3RVVFU0UnpLRi9HZElH?=
 =?utf-8?B?TXR3OGZPQk90c0dReDkyMkJHS1pNaWRacjdRWnkxRlhJMFF1bWlva0F4aytr?=
 =?utf-8?B?enpvVlZYSGE4UUhpbXVBWjdRYWdnZ2s2SUtzeUt6dDZKbE8yMnFsaktYcTNR?=
 =?utf-8?B?ejIxNktmdEM1dU4xNlhieWd5cDIveTF6S2RMZ3NGdkV6RWc4MGpLVS9WRVVN?=
 =?utf-8?B?VXZtTmgySExyRlB2NkR1alRMeC92WDExSlpkWHlhQ0hxQUdhbjNWYzh1VytQ?=
 =?utf-8?B?MFhQQytkUnBMREJheEFka3NZeDFKcWVLeTJyNHArdlJhUHR3Y2pVbGdDcWFK?=
 =?utf-8?B?OHEyZUo1MWh1Z0xwdEk3MVphdytWdEhXZExlSGlpU25EYnZSZTFyazBPWXQy?=
 =?utf-8?B?QkM4dytXZnBkaW9yTzBJL3V5aDVoMWd1NG5PbWRPdVhZU1lrOTRMZm5QLzQ1?=
 =?utf-8?B?b0kxc01PcmRZOXFhWG5CSy9rRUdkRW5ITmp4enpxODIrenNsSGdHMm5kTVB3?=
 =?utf-8?B?RG5XbGNkbk0wRi8zQ2o0R0Q0K3JKN3kvU2lrV2lpTW16Qm9BbU5vZHF6NVJW?=
 =?utf-8?B?cDNwUDZsMVY1Y0tnYjVteTg3eVd5L2FIc2UyeHpNdkFtNmUvSUxRNE9YN3ZT?=
 =?utf-8?B?RWpKaktWZll6VWVQQVRpcGZsTzVmUk56T3NhYlVlVFc4bzRuWUVwaE5OdXEw?=
 =?utf-8?B?bXNCTFZtcjdwYU5CckxrZTFIRnVxMWxjNHJmUTBKcXZIYU10aFlhZmFKSmxs?=
 =?utf-8?B?MEw4bXhhaHRLdUcvRXlRWDJnUHFnd3MxNHgxRkR1NzUvaDd1S3FpT0xXRjFG?=
 =?utf-8?B?cU84WU9BYW12Qk16SVNTKzdUOU5DamI1RU9ycjhyc3R0eDBoTElGZkpEd2Ix?=
 =?utf-8?B?RC9nakRSNjk2c1RIbFVreEJnTUJxdFdwYldxYlNBZFZkL214WFhpNzQvSzFV?=
 =?utf-8?B?eE54YW5URTZSZ01Zcm5Sc2MvM09CYi95VnpYd2xHdFgwUlFRN3BiQ3RYWVow?=
 =?utf-8?B?TDMxTjZJb3lJc0oyV1BSSWtSMjV3cTl4eHBCTGlXSnFrVUsvRWxLUGhhSFg1?=
 =?utf-8?B?MmxmOFZlSnd1WWJvYUdCTnNlQjcwRCsvb094WDBYbllpdW5uWHRuc3A4QWZo?=
 =?utf-8?B?OWpWekR1a0ZBNG1ubWZHd0g4SUUxWE5zY09sZmZwVThiKy9ZOExQdW5Gc0U3?=
 =?utf-8?B?WUJNemdUYTgwK3M2TFRYd1BDT1MzaDRsQnJZdUYybEY5c2hlYW4rc2NVTnF4?=
 =?utf-8?B?RklGVEVsMTIzbWNSRzd0dz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHlIRkswTWg3SUs2cW5UTk1vWkdtYlU2NTc2K0NZSnlQd0hzNnluTGE3TnFk?=
 =?utf-8?B?RVYxK3VXVGY3OE1BbHpwVUpuUU1FZExwdTNMRnlJaEQxYjB0eCtxRVFmRGZl?=
 =?utf-8?B?QmNneVQ1dnJKT3dyT2g3aW9BdnRlVUc0OWxoMk8xNTQ0RjFPam1WMWdtNWpE?=
 =?utf-8?B?Nzh0WGdDS1ZPYXBpeHNRbHVnS2dxalBHdkZQTjdxRE5IV1ZEZVVxcVVqT3pN?=
 =?utf-8?B?TlBVYjlWV29LOUdlZVc2d1lkTmRRelRFUlRtdUUvUDR6dHJEb3ZjSzFlSzlK?=
 =?utf-8?B?TXBlaXZ1Ry9BWFd2N0diUWd1clRPcDlCd2gxNXdHbUpPTklvbnVzNlZyeWFF?=
 =?utf-8?B?a253RldJOHA5ejNibG5CRm11ZlV3NGZQVWhnN0hxZzdBQXdWOCsxUlBLSHRr?=
 =?utf-8?B?NFdock1SUlBaSGpaMndndDl1YUYrUWEwbmt2ejdDaFBaQmRMbjFpLzNibk9E?=
 =?utf-8?B?WkFvaW9IakJtSUFpQ29GZFBra0xhODFtaHFVQ0lXVEJQSmNLZGQ0RnpFbVpU?=
 =?utf-8?B?QmgyMmk3TjFRcWN3T0RDeGNQOUhITkM2NVRiUDdqTndqNEtyQXR2OTM1UkM4?=
 =?utf-8?B?VU1nVU5QMEJhdUxjWFZ3ZkM4cldqTS9tN3ZXRmdmWG5BVUhiMCtOK3grTWhF?=
 =?utf-8?B?bzYyVjBTekJXWlAvYkYxN2ZLZzluYmMwY0VYbjNYNmpDWjZ0bnRUVUZ2Z0tJ?=
 =?utf-8?B?YzI0WFptQnYrWEdWSU8rc1Q2cmpwWTFvMytUSXZYcWc1MnFFcE1TR1JjWnhz?=
 =?utf-8?B?eTFGZytNSG1VbU5Ya3lxdmsrQ2twamlYM2haOURoWTd0cmNNWDlyT29Tbno1?=
 =?utf-8?B?dEhRK0xVelJORlYxTzdQVFo1TXczNHduZzlRR0JnYmVST0VyOXdYb3ZoTEM3?=
 =?utf-8?B?cnhmcWFMZVNIR01yeE1TN3BKaVhEY1hxQjFDcHV4SWltZjFXeVh6Qm80Qml2?=
 =?utf-8?B?bGxyVFFBZTNZYW9lM2tzYmlKakZhdHBtOHNsOFRmYmRoQnl4MjA3a1h3TVQz?=
 =?utf-8?B?b0U0OGJQNndva0NxdFZINlRkWnZnZWNUcUFwQld1ZXlXVWUxWGEzaXNBWjI3?=
 =?utf-8?B?T2Q4VE8wMFBRR2JOQ0ZmK3dIRGFCSnRIMFAwSmwwZzhCNTNkYlpuRk5jenhW?=
 =?utf-8?B?M3QyQ1lETThuUjlFb2MzUEd5TjVpS3BGMmxhV0lObDZNSWxQQVlnV1c5czlp?=
 =?utf-8?B?Z1JWMWxlMXhyYXVXcC9vdEpkNW9pNlVqS0QrSTEzVGVRYzA5M0l3SDRwQUFE?=
 =?utf-8?B?NW4yZXlpYnl5RDR4NktqOVBOeWhiVkJSRjVuNFA4clM2UTd0OWJTR1ZGWU11?=
 =?utf-8?B?Y0dMcUJ5WHlHbkVkT3BjVmFTWVN0R3JpY0oyZzZONGZmYzNrcnpRemhmMFVJ?=
 =?utf-8?B?TVVVblVQczQvL3A0UTNrc3prSi82VlFBaGYvcHZiMzRNVDNJRW9mQm9YWmNR?=
 =?utf-8?B?b2lZZlA2SnVDV2gvZW0vamdEQlJyejRob29UWEYva2xOMjJ4NElmWkRxQllq?=
 =?utf-8?B?c0pwbjBoanZFVzJSSkJpTkVzNW5jbXc0cWg4VkcyQ3VnV1ZLT0RjSzYvUk1H?=
 =?utf-8?B?WUpHVnRmc25MVUl0cHpVRjN5c0ppZmt6MEg2dk0wSVhNUzlLM3ZoRXlsdWdO?=
 =?utf-8?B?amNQSnJJZE9zbzZXRTI1TWNhS0xiUGJtN1NEdGp5WTY4QTlhSTR3ZHFqTndv?=
 =?utf-8?B?azBUSU1rRU0yM2xENDdYZ0x2ZEVLa0lzZjRERFNxUlVISGxFZVFJOFFJMnpP?=
 =?utf-8?Q?o4UU/iOKbS/om4dgGqTBMupo0Oqm4W16WVyg1r1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7cc647-50f5-4c98-369c-08ddf5c2e090
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:19:09.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PPF8BC6B51D4

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.18

for you to fetch changes up to 4d94abded400a5194b929c26b3aa07fb9485fe35:

   dts: sophgo: sg2042: added numa id description (2025-09-17 14:36:19 
+0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.18

Sophgo:

Minor changes here only for SG2042. Enable numa
and we can see significant performance improvements,
for example in the STREAM test.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Han Gao (1):
       dts: sophgo: sg2042: added numa id description

  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 64 
+++++++++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi      | 20 +++++++++
  2 files changed, 84 insertions(+)

