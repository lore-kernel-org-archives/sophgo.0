Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011029.outbound.protection.outlook.com [52.103.67.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBEE18FDAF
	for <sophgo@lists.linux.dev>; Tue, 14 Oct 2025 04:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415023; cv=fail; b=cIf/itmmc2zrTzVPi3qTnpqkvSt32m6IeTFuL0hWbLsl5EIleWfTSeK1nQrNrekCOQdPmjPmYcRQysFdi/5NA+cD1Y/TdaMUaqvOaI9mvcmAArQKLoLS/tVqEa8QzjztPpBS9jZysX3yzkeNV7GMcMyElTlwXbGTdT790g6kvEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415023; c=relaxed/simple;
	bh=a/TlYszqVHszQ8IqXLPMc5cVA4V6eZy48/uAZHwmtQw=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=cGAKIZocgJOgKrAGs+cDck3oDSpMNQ8Hp2Bznh4u8onfwmKlsDCJDqMjKcy7X8tTWg5ddR78ErLBL7S83n4+0XtKtFWMLqnpHoUSLY79sMx0SMOZhgmTCt6q8rKAi7UTwvu41YU2XpfSULT6+qWxru0ZIOPAEPGvE+n3XgsDnA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WZPDHqw3; arc=fail smtp.client-ip=52.103.67.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WZPDHqw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsVQ9ZrCSXbiQO1IxISZ/Dg1kLtkvckLkNQwRY57zhV1rFXyI21IsDqgn81oSev2Ba4rl3g5Kg9v/m2EARnV4XAI5V+EszagabO7W81cF+GZElkJaYg3ilHJx2HVZKPBzapwId+uQ9ZQKpVsQS/EzMIv0RA5scuuofMSeeRsa/g0Ql6I3TBZCri/IB9gp7GMq6uUTcFIZ41lDWFHAyxiR5jbCq5bQQ+diZn7VPTm8uFa4PRfO6xbrLNn3eDuo5l8sG0yOi/YJbahMEqCN3O3PimHxfrrYIWhaDZJzUPqUHSjw75Wjrx1DrYJ9B0TMgR0o0fIyFxPxaXiIn+slbwArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0bb5RUS/GlwUOJ7KF28I79i/QfpWjwnZsh8BwrMYY4=;
 b=maV981bs56HlMSHF5X617eFqfYHyj4udpfO/uM5vWe8rYjMZY0t+hoOzpGhotN5LTcCtosEclxG+vfN8CfBLpGdZxg/WtwV6MTRo7VDi7ja3dQQXWqk0CZKcHmd/ZmCWY3srBIeX/7gb/Kn4edofiGgIS8Zo6mIRhhBJxOlgwWORcEuLqYd4ODM+bqrCYz8vWZoJRTyUa8js4D4rghfFSPwJboJJega4aTEzfvsjkXEh+Is4MUNHjxoec9kPMHzsm/6P/nqwzq45NI0nWnqlcI+vOF7qR4VdOM8euzHQFlX+8Kyqjdv5qkLLmgosCmCCK8FL8YARj/M30X9XHA+dSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0bb5RUS/GlwUOJ7KF28I79i/QfpWjwnZsh8BwrMYY4=;
 b=WZPDHqw3YbsOynaMHBQEPYn1WUuBliSIyHn5bOyW4e73APLj0mjaaTVg0w3gX1SyCATPNAzYL4IR4eFXdsKpTbEEoaT+MPkwrf+Fv8LhDTIZluT9BrNntGYjF4cX4xKvfHpEhjpa6+WOZS/fXD9njniLyoZFpPLwMbfRKYayQMgpZlCXXUX+Cyl8mhccE09olUG2a4/uDzU718FilDXprKNt4dm8CMPHdhYgZqLWYOUBgd7PMf2TtmQwMMk6ZEECD74CN0qrZd2jP3QXZ43MtW3DRKZlvhZOh9ystsZTdz+n9glngCvvVRYKZlTjgp1veAKhYQJwdsLmgnw/gJc0tg==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by PN2PR01MB10124.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 04:10:16 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 04:10:16 +0000
Message-ID:
 <PN6PR01MB117170E3AAD37A84F720F17E4FEEBA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 14 Oct 2025 12:10:11 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Oct/14/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <ea0efb00-18a8-4a2e-9486-42deb7a3a3bb@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|PN2PR01MB10124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7510e00b-8998-4363-e109-08de0ad793b7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|23021999003|22402599018|12121999013|8060799015|6090799003|5072599009|15080799012|19110799012|1602099012|13041999003|39105399003|40105399003|51005399003|4302099013|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFVOWElsRXIzNHNJTU1qUFArdm5iV0Iyck5lZ25iQXhicWV3R0FqS3VTV1Bh?=
 =?utf-8?B?K21VNjJpMnppM3NoQldzR1lzSGM4THo3ZjZBeUlpMHMrdWtmZ0h4N3R1S1JT?=
 =?utf-8?B?Sk9zTEpGNWREdGN3L0cxQ1lWaVdpelZIZmgrdnVBZ0kwMkxpMERDUVlWT2dN?=
 =?utf-8?B?cEhxOUJjMndIRGVEY3gzQ2krS0lleGVOdWJvYU1wSzg1QVFSdnRVdW01dk1N?=
 =?utf-8?B?THF1V3RwMGdVaWxpcmxSZmQyWkptNjUzQ3N5QjhEMkcwcWRaTE5ObDdkbDYw?=
 =?utf-8?B?TE5JUmdNN09TYncrN2Z3bFVFVVk2N1NPMmdNclZVS1FnTjM1L3RkMURiRUx5?=
 =?utf-8?B?Qnd1WHFwQW5LRVVNODI2VmUwRG5LSFJ2ZDQxOTJFOTVpQ0xPZTRINjFjZ1lS?=
 =?utf-8?B?SlloYnBUZG8zTzJoZWFoVFZPeERiRjhKbDBhM1ZtWGJIQXpCT1ArUzZQN1hx?=
 =?utf-8?B?NkJUMG5hWlVNcC9pVVd4NUpqZTA5S2pHNi8xVGhTZk92RmpDWThHaXNHZGNQ?=
 =?utf-8?B?RkVnaklLdkhJSDZDa2ZjMzNHRXRTeHJ4ZWlJU0JWbDN5cWVKa01KeUJDMHoz?=
 =?utf-8?B?bm5nTmJJd1Yva3JvTjYxaVlIMmVGYVpUSHhJcFR5Qk83cUhwalc4ZVlRNzlN?=
 =?utf-8?B?aUIxT05wNTN0d3pkT1NZTmE2bWVVRE9hZ0FDd2Q2SHp1cmdyZGo0NGRNdVcr?=
 =?utf-8?B?YmREdUwvZG5Meld2c3pQQ3V5QUR2VVpuUklpTVBvWWtwWXhjYmNIS1hlazV6?=
 =?utf-8?B?ZGc0VlVmV2JkaVpodzkweUNHQmpWeDJCNGhsOW5hMkMvTHVZVEMzMVl2Z1dF?=
 =?utf-8?B?YU43SE5vdUdaVmdwSzQwK0p3Ni9TcVFzQllUSy9ibjlRcEl2SWp0YlJGbTZ6?=
 =?utf-8?B?amI0MVJwdndTalc1S2JZRkx0VlFMeW5LTWFQb0N3YnpKbzhhaFVBNVFIT053?=
 =?utf-8?B?elhiYytPTGNTcFRNWGFLUHlCL0JzamdWanN0N244TzQ4TzNUZ1ZsZ3FySGNH?=
 =?utf-8?B?MmZnYkh4WkV5MktaM1phWlVqVWc0eGM3Z1BlbDI4TU9jU0Y5SWF3dFl4eEh3?=
 =?utf-8?B?K01Jbkl2NGhqM2ZXeGlMQWFxc1VGRHRmVTdzWmU5eE56aklHYy9sZG5kTWIz?=
 =?utf-8?B?Y1FBYitOSHNBZkVYUGs4SkRXQUMwbUNwdHBHNnhqUTR4WCsxSElMUXp5TERq?=
 =?utf-8?B?VE9UazJVUlhYeDl3THQxNm05QVU4SWNHK0xwcDk1SFN3eks5NVBOZFdiRno5?=
 =?utf-8?B?TXZPQUZaQVRpR3B2amdhaStqYkRkQWFtSVJXWUVGUXBobWtpS1FzZ0dORW9R?=
 =?utf-8?B?dFp4MnZ5MGpBSEtWU1IyRUJxanQxako4OTJqYWdLSnFyM0l2OVZTSEZWbkpy?=
 =?utf-8?B?ZGhsNDlIL2FPalAxWFFYaXdTMmxkdkR2T2pLTHQxVVl1bnhCMGVFWWVuL04v?=
 =?utf-8?B?bUhyQ2ZabjJUOHplK28xOXRIUEFVbFlCb0ZQK1ZVcHVaYVJTQlk0V2dFZkVx?=
 =?utf-8?B?RkwxdkZLN2d3anAyQ1VPMjFzNm9zdmFNWVNNdGF6SFpZcU9tZHBmR3dXMjYv?=
 =?utf-8?B?bUozYU5YakkvL214TWtxV0FVMlZFY2hWMy9ZMTJFRkhWaS90YkVnWVBmb0hn?=
 =?utf-8?B?M0pRcHVOa3h2YmpScFlSOVVlU2V2OGRhNmtyaTRsaDFnZWlES1V0UnRTYWdT?=
 =?utf-8?B?TVVLenFQNzhBb3o3cXV0S0tTb2VHTUo0ZEVxL2RwV0x6SCtTSnZZNjR0TFJp?=
 =?utf-8?B?WDVRZjJRS2RrOGtYQTl6RkttdytQNXEyQUNjbGFSc3lDNzB6SlBQQmpEeDNr?=
 =?utf-8?B?cWhWSXUxZVZmVkZvNWFpQ3ExRFJKdmJTZUtsSGcyYUZUdDB3cURDL2VBeXhL?=
 =?utf-8?B?bVhseC9PUVd3NDZDU0lSdmNSN1F1TklvNjJwdDBWeEowa245eDVpTTF5UFoz?=
 =?utf-8?Q?MdOE3r3ulaNsxbCq2P/8otm5dNLB6cVr?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2QrUTdQNkkvV21IMWNqZkRFbWZYZ1NUODlvUkMzMTJmN2JaU2J2M05UZjJZ?=
 =?utf-8?B?a01pbjEzYlJMMTR4Ri9Qb2RIZ25yNjM4V2JCeGNRa3k2ZmIweDBONy8zMHh3?=
 =?utf-8?B?QVlIWkNQbXMyemN2WlRON0dzZ3JMbDBhQm5ua3lwQUMrT0ZZYUdFTmh4elRZ?=
 =?utf-8?B?TU5sV205R3Z5L0YzMThRYll0K1RZU0VpbjN1MnZlbzJabVFCV1A1eWQyTlBI?=
 =?utf-8?B?WHNJU1NQekJJUUlGNzlGd1Y4OWp3bzdhL3ROK0NYV1lkWnZOSmdST0tXcjY4?=
 =?utf-8?B?NXBwNDhPZEUrbXJvZE5vUlhPOGJJbmlraDFRNkY4ak5sOE54OW1jRms1RmZj?=
 =?utf-8?B?NjVuT1RPSVRkdUt6eW0vNG9lTGxmekljeC9lZTJEcGZDR0k3Tlg1Q1RYUXp6?=
 =?utf-8?B?blY0RVJnbm5ldk5YR2N4Z1dTbHk1OEFVanF4YVBzVEVPWkNyc01RcmZRL01D?=
 =?utf-8?B?Z1FMeUhLWDJ4MUl6aUJvZStMS29iLzUwMVVISHRqVVd0aEQraWY2Uytmbjdx?=
 =?utf-8?B?c3lPMXk1S2pNQnNiN2NBNzM1eGZlWFlpaUxWQ092cXVCakdBdWpUdmpIdTdX?=
 =?utf-8?B?dm1zcXU1TGUvc2V1Y2JEbEU0YUlYMTBaWUdvR3pwcHRiOFh0RHlUaWMvd3hy?=
 =?utf-8?B?ank1VEhoNWs0UGRxZzFaMmpCSG5EaERtb0NCY0JQSUdzeXduS2lJajdFK2xI?=
 =?utf-8?B?YjlJQU9LVm1MdUEraTFtY3EzajgwekpnVkFEU1hhelloeStrWXdBMGZSTUlt?=
 =?utf-8?B?RFExVVUzR0luSkpzTXJiSExQYnFmaWl5bmltMldqcU92NkRPelE5VlhINzN0?=
 =?utf-8?B?Qmx3VnVvQ1dncExvZ3BqbmxBU0w0S1BjS1d3REFPYjNlWk1zUG0wa2N6L1hW?=
 =?utf-8?B?TkFQaTZOeCtzTU5XaGZFNzRoQ05qcEZwdTVrR0tKWDdPc2YrYzA2UmpON3Ft?=
 =?utf-8?B?T09qdkdvVzRoaDZvTEMvTUhnbENXOTd3WllFK2dmV2hNMHJJaU5oSGh0azla?=
 =?utf-8?B?R1h4U0JqQlk0UFJMQkV0MDQ4SlRhN1dMNCtoOWJlUVF2ak9nZGs3ZHhBUnFC?=
 =?utf-8?B?S0x3MWRabUVEQ0owZnpmNWhqMVpsbVl4TnJTb1FHWk5JVFY5Um9vdTBSWG44?=
 =?utf-8?B?ZTlxcHR2TGxucGpkZUwyUG55aUZBUFhIMlplbEdBMVh0aXZMMTJ4b1JYOFVY?=
 =?utf-8?B?bVkzMHp4SFZGazFobWQ3M0pHS1kxL0NxWnp4UWdWSkFEWGlWVEliOFpJNk1P?=
 =?utf-8?B?V2FJQVhidjdiQXk2Q1pZRWcxSnR6SWNUN0VmRlVxb0RqNi8vWWgyTzFBVHhD?=
 =?utf-8?B?U2trTDBRVlE1ZUxoWlpKVGU5dldJd2hEMmhNdncvVS9VUXByVHY1RmliaFBB?=
 =?utf-8?B?NkF6SU04Z20xR1Nnak1MQjhrRnZzcnhQQVdzejNrRFBmVjNxOWc4T29zcWMx?=
 =?utf-8?B?TlVVT2JLMk9MbDJ0Syt5Y1EzelErNDZMWUQ0WGIreUtrdjhYS1JFNDdmUmhh?=
 =?utf-8?B?SE1RMW1jbFhjeENCZklDQkpmVWhtdVJyUmNaTitpWEs0dTVSbjQ1MHd2d0dy?=
 =?utf-8?B?WWZNVHBud0lVeHQzWDcwRWFKa2JqekJGV2tnY282NTBBald2cXVRbllOdGJ2?=
 =?utf-8?B?RFlUdmlrNU9wZmsrN3UreVBJYVJaaTNmVkZHczhnc1lsM2Q2c3doWEZpYzhC?=
 =?utf-8?B?YlpqTXM1K0dyYnNsWGo2RklOT1dCTlRYdTZGaXphcXoySGFPMzNOYjNLdnVR?=
 =?utf-8?Q?CWqywuZM4xMGvUrNx9Y2XMB85DJ8KxVISH+H+at?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7510e00b-8998-4363-e109-08de0ad793b7
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:10:14.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB10124

Last updated: Oct/14/2025 @https://github.com/sophgo/linux/wiki

v6.18-rc1 is released, following patches are merged in upstream master:

  * CV18XX USB phy
  * SG2042 PCIe binding/driver part
  * irqchip/sg2042-msi: Set irq type according to DT configuration
  * dts: sophgo: sg2042: added numa id description
  * irqchip/sifive-plic: Respect mask state when setting affinity
  * irqchip/sg2042-msi: Fix broken affinity setting
  * PCI/MSI: Check MSI_FLAG_PCI_MSI_MASK_PARENT in
    cond_[startup\|shutdown]_parent()

And some new patches are submitted:

  * CV18XX Top syscon: Longbin takes this work from Inochi and post v1
  * Duo S: post v2

Thanks,

Chen


