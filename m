Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF17404E
	for <sophgo@lists.linux.dev>; Fri, 29 Aug 2025 06:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448851; cv=fail; b=P2nW7Zhc3aRSJYzFfGUSvto0oY6VlbM1qCp1vUs7N2JBm/swyzVNMrV8rmeW515+echMvwQ/Omziy8WYuY9QsmPmXNjrfcGH8IQIJgTC6qS/0x/WFtinoQSc2UDeCqT2pEw96GwRRaD7ymzesp0WIZJAfZ0pkV8CthMu6SFpWPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448851; c=relaxed/simple;
	bh=G3SAuHdjwIoPuf6p0nZAksmJirDv9at2Y2SFpzX7SzM=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=GRaxOnKFTjh/fTrNVGbvnC1XXKeEkA5yKckQmJq/wj/33W+H4zEkM0l4PtoiAUqJ6atSy5Yol78GO/HjHoWS+aNp0Oqt5fXNDVFH3vhLBxBwURk0dksw4gpy1a7hpE67dwHZakb++QTBOUfR60bpjKw6lRJd3eNWsVWtAYwkUZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ddT4d/Ns; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ddT4d/Ns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x60qZa6lZGXOx0wHh0vJBs2qenxeosG+Y13EEPnAKRzqUl+tXKsiNvuehpVfqGf/V4xovRQ1w4Ns4u5W8cLDDDmUYpDqfWim2gGsFWEXk4+yygAFKnZf7CaCosMz125pZj/QUE6u6K0tzoCGq2iOTipqQ9Plh8d6mGQEfQ4Od7mFzezzNgY94UAV1HelLjLPBU+cq+WBGtXfRnkK9fQ6lfKGFsPIKHYX18NZ50Oxky5HStodvxbDNciaoyNIBODTqt5VfmKaAr6uuWICKxi+qHIXSL/LFxkOBFDx2av7CA/q9C33lE1UpgNFl0Lva25RI9xXcW6t79WMouqXUMnfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIFpoGABmFISj2BSsGtZe8wEPvPmBv5SFtAr+cyO0dU=;
 b=IVkVXuyg/88tpu9myLM+F8POCAHDLfywE8n1oSFbZaTZ6X0nfCxJXiA3bLlRbWnyapuE593Aco8o+GxWDYvDntVY5ixqLEExZhQW6FQdzyXwkpEBeuqXfMLzpHL2QcjPyQIl61qIb7mN5CoZa8CqY4VE8qhJY/cWZvuAUpcXPKC4qaudTwjPu/vQw2NTlJIJQzNfQs+m7TgSlcU4Hlg98GOAI1/crl7jbz3v5fDi0P+W1Pb3LoyVtDW1QpbqMH1bC+ucvhwtcxgAkbAO63VR/ZFEQgmGcEwrWoQOtnp/1I1yFt6EM45Q8mjGSxupfWb2GcFlfS6MecAIitjs3i3plw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIFpoGABmFISj2BSsGtZe8wEPvPmBv5SFtAr+cyO0dU=;
 b=ddT4d/Ns0POkGjLfZygB7LBz/PbqI3hsxmiB/inBpa6TeJeD9Qp40czoRITrRm3cy60p4tDh01EaRuKbMCuXrYA+0xzhY74OZ0Adj/g4pJxzjgDdOnTp3l7kGFb6GTEUP7WzMQoUTcxkovOY8vqxZNxm6SifdNxRrowpwX4vrVnTEmz5PV9EJdfM2rZsd/R9Cie42L2rYVQ7tiRr4va1zD0PGuIKyjRxq4UryVJpA8Uy2A7plEWAu+3v6kJcFKJc/htupnC2wdXp0MMnqJjyU+J0SN3aUhQ8ymKnJsp4Cc+lJJyxlBZJ+zg4IVfyraHGUXqSs6kt2EdHaNgf20tcMg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN2PPF8B0F1369F.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::5a0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Fri, 29 Aug
 2025 06:27:23 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 06:27:23 +0000
Message-ID:
 <MAUPR01MB11072A1AFD1D8A18ADB301594FE3AA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 29 Aug 2025 14:27:20 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Aug/29/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <d6877855-7f3d-48f3-a0c5-412c2903c5da@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN2PPF8B0F1369F:EE_
X-MS-Office365-Filtering-Correlation-Id: b80901cc-5051-442d-e409-08dde6c51d0a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|22402599018|8060799015|19110799012|23021999003|5062599005|461199028|6090799003|5072599009|1602099012|13041999003|40105399003|440099028|3412199025|4302099013|39105399003|51005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGhzYkNGUXR2dWs2UlNKSSsxajUzRVdtczZYSDFvZHZsOXBTemRHQXY3dGdw?=
 =?utf-8?B?RmtsL1FLUmU0SkZJTlNPTE5uTFRTRDZxZWxSRnZrM3E3OUNVWU1hRUtuVVo1?=
 =?utf-8?B?eFowek1iOTRmQUJyL0Z6WnRaUDBZZHZYQUNuemMySG80L2VkbFNEanpHOXdy?=
 =?utf-8?B?QUtmN3BpT0ZXalIvb293Rm9Md2pRZGIzUnlHVVFoZmhXdWNmSEc4MzBTaGdO?=
 =?utf-8?B?ZU0vcWIvR0xlZWdvYW9zaUNkSmNyM3l1eE93Qmx0UzBrZjJEcjNScXlaQTgx?=
 =?utf-8?B?R2JtWkRNWWZhS1lQZzUxNFlDRTVBOXdrWU8ydjAyUDBUUlpEZUN4NUJUOGVI?=
 =?utf-8?B?NjNMOTQxME04TEk4MWI2d1Z5RXJqbzB2dERiNGJhMXhMcUFrQzRZd3NVWXUz?=
 =?utf-8?B?czI1TXVjR2R2Q29GRHg2cHoxcndoT2NkZ3lKczNKeDVhRzdyTFVQV1hKdVdJ?=
 =?utf-8?B?N0FIaXlZZ2FlQ1BYWDJiUWw1RVg1YnduZUEvWUpnN2U1MFNkUGltVnFjOWpi?=
 =?utf-8?B?UXMyb2lkTzNPMTJLK2EzQ2lic1pUdkp1N1dOcnNZSWM4UEdDdlZVTDZ2R3cy?=
 =?utf-8?B?STBNQTlsUFBMNExTaHllS0tGZEE2eURyZnNqWThXOUZzUEJKcEZuNXZBMGxS?=
 =?utf-8?B?K3NOMVhYT29xQjZqZlk1d3cwOEZyOHFGWUFlK3VaZkpQb2VXMFdjNStTTENs?=
 =?utf-8?B?Z2NnVWNBK25pRmJ3WVl3UVB1cGwrTi9tbEZVOEU4WS9iN1lSUEJOdDRNdjQ5?=
 =?utf-8?B?MEJJamk3VjFWcitBaVFoL2NNSlBTRlJqUG5vM09TanJ0NlpzRjFIaGVFUFhi?=
 =?utf-8?B?NHVFVW1lcFVDZkJ2WDFaRE1neWlwWFRxalNDdXMySGl5eGpLVkhXek9BTFI0?=
 =?utf-8?B?TzdqSFRxL1Y1NjVzcWQ4N01qRm5IQzZMdnJCRGlVbzZNejBmc2VkdHNmYTFt?=
 =?utf-8?B?SGE0U1lLeGgvV0ZMSHBXeU8zMlVRd2dCdlQ5RkdFRzBwaXFuQXFSeFNianht?=
 =?utf-8?B?cys4eDd2WTZnYzNUNUNtMXoxaDcva0RnQ2NobGhaTjFCU3MrZmNpaVZNWEpJ?=
 =?utf-8?B?V3lGS0F4cEYyM1BLelhHTmtuQnc0OWhEK1o5NVZQcEorS2dnRDlWaXhydVhK?=
 =?utf-8?B?TzFXRHA3bncveDBVYVpsOUovUVBRVnVtbjFDdno5czZZZTNJUGQ2M2RoQWVU?=
 =?utf-8?B?ZmpOS2RtYzFkbHpnR0Y1V3V4Zk83NEhsYmViUlpTVGJkWHFHM3NWKytSZkJC?=
 =?utf-8?B?bW01N1o3eEw5WUtwcEY1bEVxUWRsdy9XdVBzL21naUZEbkZGRHF2N2pPdko2?=
 =?utf-8?B?U0YvYnZDN1haWUV4OWZTa2t0K09vRHYyRTFiS200OW1DK0J6bWlzMDkvZi90?=
 =?utf-8?B?U1dZOXdLSWc1WDViQWlkN2xkSnpTcVF2TkN0VVdqSHl3Y1c2VUlNMmJLWm5C?=
 =?utf-8?B?QnBJME5JVkYxRXBwYldRdGp3bytXWm5YVzNFaHd4VDM0ODV2K29aWUlzMnNJ?=
 =?utf-8?B?Z0kyNFRienZNdUQ2bVJiVmpGcXhWbkpSU2pRM0JhUUg4VXlnWjBSaFM0bDkw?=
 =?utf-8?B?Q29PQ1lZdzl1ZjJMUHJuSjA2cEpONk5LZ3AyZDVpUlMzemxET0NueWFLdGEy?=
 =?utf-8?B?SEk2bTA3ZGh0THNMSkVyWE1xS0FybXV2b01NMGU4elVnZXNXQU0wVlk3enJY?=
 =?utf-8?B?OG5rVEhKUmdTZ3VrWTlwRkhMRStCcnhOSW5CS2t3MHQ5M0VGa2RSVGlmWGFz?=
 =?utf-8?B?NFZqNVlnSmVEZ0N5TVVPcEQ1U2JQUU5ZOGk0ejBTckd5VnFDU2Z6UFZTS1Er?=
 =?utf-8?B?M2Fza1M1Ky9UUDF0Z09VZUVTUVJLQ1dKNGtCZVlkSWs5WmtQSDZMeUozWG50?=
 =?utf-8?Q?AgTo4AMjSIcYW?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFNRSVluOVNCQmxoRmZNS0VtQ1JYNmU0T1NtWi9FZ3c0MThwdHp6TlowSEtk?=
 =?utf-8?B?MHBnM2o4K3hYbE9mbUZ5K2duZzhocjJsWXFpM1RUVld4QVdScWVPbFVjbEhr?=
 =?utf-8?B?NzR2YTBmMU5UeWFVM3FIS2R0dW9RaE4wU25xUENqZmVwUVhGTTV5Wi9uc20z?=
 =?utf-8?B?bUgveUpsSTE4WEVIc1Nhdy9KczM3VkZXSlFRdXlDUnFDUU1ZK0N1OC9vSVdZ?=
 =?utf-8?B?N2lHVXlwNlZEdkJyaVhIYnRaak5VQlovZCtyNlp5MDJ6cVlPODB6TGZMMnBF?=
 =?utf-8?B?dStZd2NCUVRxUmhod0I0V0ordDc3SkVuMU42aCt1UXcya3RpZjFrVDRVcEhP?=
 =?utf-8?B?ZjlvcERXOHpFZ2FLZXFTWThnWDJtZVgrU3FycE85WEhCNzJMUGdsc0Q4UUFQ?=
 =?utf-8?B?S1A3dVlOSXJic0xpRVk0WGl0OHBtQmxTckJUWDNDaTFudGd3cVpIQkR1TGhR?=
 =?utf-8?B?QXBvTXF4YTRZM0JDak81VG1ZdUVYVUQrUmdFUktKVDU2ZVczQ0xnL3UzV3NY?=
 =?utf-8?B?dXlnWXNkUUl3UzRIT3dBUVJXL2ZxSmhDdDBaT0p2YmxGNFdkcjNpVFdEWVZT?=
 =?utf-8?B?NWMzQTc3NzY2bklFbkQ3Ujh3S1VBQ1BtRFlMSTFvOHM2ODZJemxMZWptQ1BY?=
 =?utf-8?B?dzVCT3pjUE9QRkpRTEJGcmk0ZnQxalNERVBKNVJCRGhQTUVTTDdxUmNGQWJm?=
 =?utf-8?B?Q3NMekNtSFQyakhVWS9CWEkwUUUvdTVlcGJaeGg4c244V2tOYXlYeXRwdXQ3?=
 =?utf-8?B?Mnh5N2gyaWFIYTYzQU5pMDdncUQrTDk0c0t3Y0lGTlNJR0N1QnpHejhFZWNo?=
 =?utf-8?B?SlluTDVYRHZ6d0RPYytqNnoxWTNmUHRBK08zeklacUY0M3RyR2lJYTgyaWE4?=
 =?utf-8?B?VFpYK2ZqY293S3phZFJoZjg2dWJWZjhLR1VtNmhLUlk2TVFkeUJQY0xGWWhv?=
 =?utf-8?B?NGpUbFRSWlBTT1ZPTWhVZkVuVnIzcjAvMHRBeGQ2MEM3R2lQOWIxL2xuNWRO?=
 =?utf-8?B?T3dEbzY4U1c2WVFvNy8rYlZtVXRJQXcyVm5hUzBkd29WYnpCcFZIQWR4Uk43?=
 =?utf-8?B?MWxHOU4rREVUNDNybWtodmRjNGpiME1ETzlXQlpTVEVrYVdpaEpMbjg2K1BJ?=
 =?utf-8?B?UHpXR0xWbEFBTTE5M1FzcERuSXV2ODc0b29zRCtqMGtaYmR4Rm5ieFpzWUUy?=
 =?utf-8?B?aVVmVGlTeEx5N1R0bGl4YjNJbXd3c3pmK0FrY29qYnQ5SWJaU1lFbjBRWXM2?=
 =?utf-8?B?ZUJIaFdSeFBNYm5FWVgzVlN6aXljQWt4SjZSTmk0WkpxWFhmNWNTTnlQWEMv?=
 =?utf-8?B?T1gzenZ5aVJ4QlZERlRuaHJKK2VjMCtkQXJFZnlMQkRySGVGTUh1bmpSalhT?=
 =?utf-8?B?TUNSSzZCM3grWkxneWNnSHQ3M3J1WlBVak03WWMvRCtySk9RaGpOd25PVE1s?=
 =?utf-8?B?a3grWEN3YkV0T3NlcWpiakIrMGwvWlFjV3ZIUGVNekJWK2g4TWFHVTJiMFFa?=
 =?utf-8?B?dVpBaStOeWxnS0ZTSTFjMGVYY09lQmJxUmhYdGxhaTAxZXNTS2JNR2JLRDZq?=
 =?utf-8?B?RTRHYTgrUWNFMXROTEs5Y3NDdXhxemEvRVJrSjVPSlFXYXhkQjYrME1vbUho?=
 =?utf-8?B?eWhVUm9zSENoZndHN3NMZ2RwWWMzSE5ZS3M2NkhpODE2SGM2Yk9TZkNFUHY4?=
 =?utf-8?B?cDRZQWJGMVZSbmdpN1FrV3RTR080MFAzMldFbXlMTWhpVDV5Y1pmZlhWdzBk?=
 =?utf-8?Q?pgU8491AP+qsK+XbfA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80901cc-5051-442d-e409-08dde6c51d0a
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 06:27:23.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF8B0F1369F

Last updated: Aug/29/2025 @https://github.com/sophgo/linux/wiki

# CV18xx

- N/A

# SG2042:

- PCIe: Resurrected, new design and dropping the supporting for old 
32-bit PCIe devices, so posting as a new series as v1. Old series can be 
found 
https://lore.kernel.org/linux-riscv/cover.1736923025.git.unicorn_wang@outlook.com/[here].

# SG2044:

- irqchip: affinity issue about PLIC/MSI, fixing patches are accepted by 
irq/drivers. Regression found and a new fixing is posted.

Thanks,

Chen


