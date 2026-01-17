Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCCA49620
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 00:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768611367; cv=fail; b=e0I3DXmXGo69eQmLoLphsk/ao9uEuvoZf3Wu+wcOyDtSsF2Vbb9mUZLclYyyaEvYPtZJOmlMTpb61LfjySrL4RxjbpJFkf2caEHB+rRXPwYPBHubHFonFzRwDvrA1kllev3xXus88bkei2bKnhWaMk2sPXWF6uhVY6PTYYyVO+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768611367; c=relaxed/simple;
	bh=LOQEesDanmJnvcM+j4U8ctzzzjjhvgehFDjjeCQrP5I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EiQweR1aveJPxG3pEQiqnobzXyD5WInGl10YnFImW0HyvmY9jSq67SKYpg0/TLnlI/Z6d03MimV5JmfelQIESzyULw3rSeDjhueQsB0P4/KiOcdPMo4oKH69HOzMf9+XSRLvxp2SSYExH57vO+YAlEPLjw8RFWLmERz8P6byV2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bj/O3EF4; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bj/O3EF4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvDD5l4Dcr7aaF+RRFVlWEmAgQ5g8Bwcd/bWFxDu16iRlr0rlCJZGtRVmg0cH8XU8t6UQgLw/EhhBsa5x0L+2O9+rpe+RVd+dmya4UJ3EctaKMOYX9EYALuDxcu6zsFW/D10lQaGWBmwFQvU1jPSNp6eVD49GHrLKKIxBBC4FmrbgWBmefdgWaX7A/LkXRI10cGepELgz8rjvXpJjo2uaDL7jtewng95TpbXvPh8YHiYGaVq0UVbOBGzIqjnAUEd51FIM//EVSvr9U9NObC93sNysXUbcRfNZKKr27w31hVKRi+fNmWz6L95yzCpq9P/2ACHCLKA9LGDNyZIfKWL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL/ZSoWOrTYOrEWtVbG0DAAbmshof3X2PneYuvYfdwI=;
 b=F4cuawscxpFuLuUynmnmJRZcsWRh7RKXYQPZlQGWBrgvsSWdTzbyLBlxA2lsmVgpilnYrivCnJALnM+Gr2HMblIlz14fUMZLVmz0I+ielyVtqR0r93Y2txE/JZr7ym3Gi3tfu5GHlVJ7Zli2U0pgtGi8ghIwyO2wSz3iLrAsqBpKlayJomI74Xo1BUYjS0GQW/IoTQBWzP/3sF6RjCFIwhQFijSsBgRfTeBErOHXpEeUS45aNNziCl/a7GtqZHnXpPaAai9zAn3K6ph863JUI4REq2kP1XT6c9Gi75e4JssCzHjrkji1LjuWh7Zqbu6fUuZ74YbAgma1nyYAU/A7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL/ZSoWOrTYOrEWtVbG0DAAbmshof3X2PneYuvYfdwI=;
 b=bj/O3EF4c4hMlhKt1ikzIWTD6s8HsE4ZCCr02gepPIjAOkNs1KSQB+yZ51JuXXwQGOrpEo3lgEBjWwSsmTsEeAsJR8FXCluthG8J4KDYBLu8v6pxxzkhGr8TDUEFjRBsyNWD8uxDkf+6QqIhkPsO8fRXmgYu814mzeXJxoZgwb/+4nN0CqGOSxO1+Xg7rP7pbWGErTG8u8hEbfyFVUaEqWbCGBhyolAxbR9EBfvoL8XF5RSUJHzNAVfOtl7OMWjt8VKrBx7wFc+a5VRolpIpzy56ES8kJ0raVo/641GPnLwAAPOcWutjb6xwDDJJTcOkt91ZMf7RI/xIfAly9qG9Og==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN0PR01MB6601.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:73::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sat, 17 Jan
 2026 00:55:55 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 00:55:54 +0000
Message-ID:
 <MA5PR01MB12500483EBB07C8495004C053FE8AA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 17 Jan 2026 08:55:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU
 dtsi
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
 <MA5PR01MB1250082D757C8DEFE005EE71AFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <aWrZpoMOwTnFqlGN@inochi.infowork>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <aWrZpoMOwTnFqlGN@inochi.infowork>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <f2ef9a6d-5644-4fc5-8762-c939d4021947@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN0PR01MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c62c444-32fd-409b-6f61-08de55632af4
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6d5vbofsfC/jnGJ+j4hG4ECk1o3ZU7J+9dOOgx8jJ3RnOOiNM789a8oYxgHv0cAQV7t3CvPgNwGWFQgtDFa85Zt2Re967JQutk+xjaEdyy4IAB4AHNheS3PLhpB4Kn0fIi9lkaOBXAJrK9ZWktsqRFAAD9/xXWaMyfl+1i/sOCXE6AElh3mqDVp00Iqc9OowFHAtgOXck1LXa9KoHkcnh/4NvKslwhLdKk+Ed7YhJ9O812KXaOkO3hV5vzP8EBhv79PPnXzTgnTTBtVWMw+WQzwysFcoVXg5z6WWg+QeFC6EWlhB5u9v4rlL+rDLFjRphEeJtEXrDNamocQo4AdKGWVIPKv+1jDOwWrmrb1vF2nT09+ga+PH7FUN0+KHrkdJnbvZzA/MHZsL7ZENmMbb873i1+fwOpFp4ShNADkE6DLs6FoI7VUWweiR5ephLb1jSuR/T5BRt4rEllaiSwkwwbnpAoX79a39029s2HTaixVDlfld2m9YwHIeBcwcTweXwDvQ+EPXe0wY88wNnhZ4rbqhEwXzrOKwOAzDADIqWmw7EEeEg6NAYjGeyfZOHVtdXRELNi9mUkSCdtFDDWH61eVOkyhNWYVzGN1pZMaN3M2aSzB8q1wGKjPbA95BUquhUao8y38NAYuB31YPmVigqSN5o+l8Z4qJQ5aXHVq9GPyArw/CWKRcGf+2vGijrPp4x9mYqz5pdHng2GeKOak4GH6fMhHw9Mkz8yiL6jRR5cbdewAvhWL/UxsO1KIP4RKhiU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799012|23021999003|19110799012|8060799015|6090799003|5072599009|3412199025|440099028|40105399003|52005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDZDOUFnWVloay9Yem5ON1QxbWVyUUFqNDg0TElndmRsaTJnSWYwK1pqaEN4?=
 =?utf-8?B?OTZySkt0bmVZSTVVeXQ0QmNxVmJzT25yTU51alg3WTRBVTczS256K1RNdWlz?=
 =?utf-8?B?NnczU01YaVkwMUdoWmVvcDJEcDUxdjJnQlJCNEVoWHpYV283bUw0NWhLL1U5?=
 =?utf-8?B?djhYWFZsZ3d5cDJMdk4rcWlCTFd5Y2Z4VmM3c0F5Y3pvWWR0RFFqYmN1ZGJ1?=
 =?utf-8?B?Tlp5dk0zTWlUN1lFL3ZUaDU4TVRZVW5tQ0F4S2RNUG5PTTJKTkJrWWRJeXRK?=
 =?utf-8?B?djc3clJITFlsUnJGRFQvRWN6T2dwbWltQnZTZjNma2pSUDc0UHZ3K3dFbERh?=
 =?utf-8?B?Zys1enJta0NIaG9aZ201QzZwQTY1YjM1Z2M0WVl0L1RKTCtTMWZjazJGV2pl?=
 =?utf-8?B?SGtLaDk2TjNDU0tsSkpqV3djdmMvZ3V1ZklUajBYZk1ZMG5rM2czaEJ0QThQ?=
 =?utf-8?B?ZVBCT0NGQ21QVUQrWFV0dGZBa0lUTHhVVlM3bDhjdVRFOUloTzkrQVJTcFpS?=
 =?utf-8?B?V2VzVzBkTmdBMFlEMWE1blovOElNWHY1cURPN3N4Vnl4UE4yY3ZVeG5VV2Fl?=
 =?utf-8?B?ejFMSHBLc2F2TXJmM0tGQyszWUoxOTZpbmFnU25QSnhhL0V5dVg3bDc5Y2hu?=
 =?utf-8?B?ZVVMQW9OV2NKQnNhTTF6emZRSFR5NllhQXRYd2lqNzBLUm9xeWZBMVZBQm1P?=
 =?utf-8?B?R3VwWEl1cG5sb1dtMFhFdmptL2MyTEIwRVhkdVZTakVTSE5JTVY1eHNPNFR5?=
 =?utf-8?B?Q2IxeGFRNGtkYUpZREJFeGlBVDQwZzBHUWpCcFJPV0ZTSEZteno3aldFMXdh?=
 =?utf-8?B?QmE1T3VGS0I2U1Eyb2M4d3l5M3k5RE4yZGFYcE5XRDFGSTBmQjVuZldEVlQ4?=
 =?utf-8?B?MStabkVhNXBNMzlCUlVaQkxVRGJVMWxDQUVnSFJFdm1MdzRxZ1lYMVJEbHZL?=
 =?utf-8?B?NEVVTGJ0cEpPK2M0bEpYTkh2MU5Fcy9teW1HYUZKZGUzdGxmMHJRUDhzOEdE?=
 =?utf-8?B?djY4akZNTFBQTjdWVGFwSVFGVWZBa0ErSHpGVWNwYU5BNlJ2SkV4ME95WFVQ?=
 =?utf-8?B?M2xuRHRmclJhSjVkTldBT282UEMzTXp1L3pmRzUwUG01OWJSa1BLZWFvaXF4?=
 =?utf-8?B?NE03dmJuVmxYZUhnbDNUOW5YdnR5RjNrNG9xMWpzTWR1YXM4bUVydnQzK3FN?=
 =?utf-8?B?MGs0NzhDMis4MUt6dnpJL3NmbUc2aUtyWFdjc2txcjMzcXMxdXVzQmN4SEov?=
 =?utf-8?B?YW1GSkNrVERDRTlPMURzUjlqQUNMbFBodW85ZFVjM05CNEhaSENmTVFsQkln?=
 =?utf-8?B?d2dmakk2cUhIK2s4elozTG1OZ0gwN0krbUVwdDRSNGNWY2NqTDM4Mi9OQ1E0?=
 =?utf-8?B?MVFmckFpd2VpSTgzcFhWdFlVVi9UMDIxdmViZDdCNkdhRWlmSXVLaytRR3RL?=
 =?utf-8?B?THNZa3gxOHF3N3U3Z0NMRkE1NmI1Y0ovS0duZXVVL0dYc0NPUmhXK0JZRnUz?=
 =?utf-8?B?Nm1iQnNhSG90NlRWdURicTBXQTFrLzc5RmNCajN2ZDdGMFhGQ2djcUtvMUow?=
 =?utf-8?B?ZmpyYzY5MzkzV21KN2pxYkNSQjV0QXpkRUk2STRzRTlhbGF0ZG4yZVphQ1VG?=
 =?utf-8?B?byt3dmkzMHBraFNGR1Zia2x2ODlteEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1pzQ0wzVFNTbm5vaUQ3VHBjQVlXeG95d05XTDNzQ2h0SUpKS0tJZEtTa0pw?=
 =?utf-8?B?OWpSS1RsMmJVcTJYRU1Ea0l3a2pDVmdMVEd6TVozdmVVR2hUM08rb0p4V0F3?=
 =?utf-8?B?MWdkSmhiNzg4aW9IeStGcStGMk1TNEJ1ZW5TcThqdjFJcFhVeWlNaW55NGR3?=
 =?utf-8?B?ZWN1d0lzREhTc1hpcnhBaTl4TTJ6Vk1sNkdpOTVYU1B3Z3RvMitWbFdmZlh1?=
 =?utf-8?B?enVISmhyaXN1Qnlod3lEVnR0MExmMUxFbTg0R0pOcHdYbHVuM0JvaEhtODdQ?=
 =?utf-8?B?aWVyREZraUJwTFRvMk5mc3RlSUJKeHJBcVNoSzY5dkxkMVJBK1pBSmdESVgv?=
 =?utf-8?B?SmNqejRLdEtxcU8rWXpiV1FNKzBwME0wQjRJcVpFTzdVY2lkVU9WbnQxSkJp?=
 =?utf-8?B?VmdNc2FyWU1UdTdaN0pDRkIyWEFkUGJuY2JLWUxkdXFQVjloSTArSVQ4K2Qy?=
 =?utf-8?B?dUZ4MGZ2YWtxTzFhWFFzV25ESng1QVhPUzVnSG1kK2VZekRVOFZTZVkxV2d6?=
 =?utf-8?B?dENUSkUyRWJKOFlGa09RbU0rZVFONTBNVTRSUGpJMk1qU3lQSkt6WFBCN0xQ?=
 =?utf-8?B?L2VLMUZraVhwZDU5c3JlS2NueWNmWTNSN3MxS2duWFczWFhrSllNdlpDVHVR?=
 =?utf-8?B?c1BmM3V3SjRocy9rdjFFcW9UZGJYSXlzVUpQbnpwUkUrOGVKaVpsM083dHBs?=
 =?utf-8?B?WndTbEJCT0RnTVNVQ05lNzI2NjYxWlVyMkdXOU8rNStSTVl2ZVQyZzNVMktJ?=
 =?utf-8?B?K2RyYW9ydlRvbVRPTXRSSzhFSUVIVm8vem9TWjNEVTR5MjBtbW1UNjZjMFI5?=
 =?utf-8?B?cDVyWVE5THRVNmFNejFuV1RUQXV4ejhvRzVZUXBJZ2lDYldvVTBleVFWeTQz?=
 =?utf-8?B?ZW0vUk11M0s0Q3lOYTRyejV4SDZlcTErRUxDaSt6TlNJcTZtdDVtQVFBazlK?=
 =?utf-8?B?a3BlaktuWCswWFhHdjRDaHFnZFRrWlF4SFhWb0I1aG1SSXpnYXpPZlNPSUdZ?=
 =?utf-8?B?anNLSmwyMGFGK2RwODVFWHpmWER1WUVBb1p0S3BpQ3ZDNlgwSTlHbVBxYVpH?=
 =?utf-8?B?OHppR202WHNMc0VKcVJWeFRNN1ZUcUZLNjlnQnpoVitnVm8xUGVMVnRCc3N2?=
 =?utf-8?B?TU51YmIrdHI1WEhkR25SMmVlbFJNam1DN212Q3NSQUFQUTBtcUduM2VOM0g1?=
 =?utf-8?B?em9laXJueFc4cTBNMDVTZHA5Z2F0QmlxTGpnTDNNV002S213YXRzRmExUndp?=
 =?utf-8?B?Z3pxZkNyV1NWTzV2dDJscTM0d2JhRVU4TGtCUHEvOWtaVm1IV3JzZTBaQzNT?=
 =?utf-8?B?RzY1a0NEazVaTDYvaFU1NWwxNUpvU2laVldrcGNBRk5TZjR0Y3dSQlR0VkMy?=
 =?utf-8?B?U1Z6QS9scWRDVG9ISjA1R21XaG9mVElSNFRYQXkwZXFnYU9wZXgzSEdXZVhP?=
 =?utf-8?B?M011b2FpVXZ1Ylo0UnpsK1FaeW9xcVh4Ny8ybzRvMCtERWs1M0g5MXhKcklx?=
 =?utf-8?B?dW1USFFYdHBiclRITmFBN1RQS3VEUnVBbDZyMmtTNkROY0k2MVR0bGVNYll1?=
 =?utf-8?B?NFVnQ1lpMXBIcGNVMkxxRTlzVnptQjNzczJCbm02N0hWMXk4NW12WWVtMUlQ?=
 =?utf-8?B?RGNxd2ExWisxZWZkWk4yS2UwR1NCMm92ODlMWFlKZ1BjZVZmUi9KQSs1QXls?=
 =?utf-8?B?ODQ5UDQwRTJpMU8wQkE3WllGU09KN2hFazhFdVFSa2hnSDY2YjQzRkpmK1Jt?=
 =?utf-8?B?d1J1TFlSZENWdlJrcTBIVWZzK0RyK3RKTi9XM3NWL2FIWklkNVlsUzdCK3F6?=
 =?utf-8?B?V0xjSnFVZm1mc2h3VjZ2SGlsQ0owaTAzTE45RXVhOXYrTUNkODhUS1ljZ04y?=
 =?utf-8?B?OFhXVnRGeTZoLzlRcytyelVUUGlhb2R2SzRaSUJSMlBwVFpVNVVXNWNYRWR0?=
 =?utf-8?Q?mUiM6+fU8/AU6f+y/YIYKVYhG9x4RqLt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c62c444-32fd-409b-6f61-08de55632af4
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 00:55:54.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6601


On 1/17/2026 8:37 AM, Inochi Amaoto wrote:
> On Thu, Jan 15, 2026 at 08:49:54AM +0800, Chen Wang wrote:
>> On 1/13/2026 10:38 AM, Inochi Amaoto wrote:
>>> As we have a separate CPU dtsi file, move the PLIC and CLINT
>>> node to the CPU dtsi file. This will make the sg2042.dtsi force
>>> peripheral devices, and make the CPU dtsi force CPU related
>>> devices.
>> LGTM, except for the word "force" in the commit message; it seems a bit odd.
>> Perhaps it would be better to write: "This will make all peripheral devices
>> are defined in the sg2042.dtsi
>>
>> and all CPU-related are defined in the CPU dtsi."
>>
>> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
>>
> Thanks, it should be "focus on", I wrote a wrong word, If it is
> OK, I will fix this mistake when merging.
>
> Regards,
> Inochi

I think it's okay.

Thanks,

Chen

>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>>>    arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 305 ++++++++++++++++++++
>>>    arch/riscv/boot/dts/sophgo/sg2042.dtsi      | 303 -------------------
>>>    2 files changed, 305 insertions(+), 303 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> index 94a4b71acad3..509488eee432 100644
>>> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>> [......]
>>
>>
