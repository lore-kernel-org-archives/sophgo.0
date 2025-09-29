Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011038.outbound.protection.outlook.com [52.103.67.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B7239E63
	for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128132; cv=fail; b=OM3mbttpr3+S2y8O5Bbkebs90sgyK5KCQDqbB9eWQNsDTQOte7Qx8uBHB7WhT6HqfYfmttcvuSGNvHuLJFQ31VcPhTG+9FptyPDftKnMOlmYbCY6U/AbUuC9MkLVMxtDs+FSVZg2lHd/9Hq0tr0B323KhEc1N5KTBjSdhn9a7BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128132; c=relaxed/simple;
	bh=p8RSZXOtSQ6tPG0fN2950mz1q8PPk6AdqIqlTkY1n5A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b8x0lJxKWExa556VkXT3+4xCh1KqnRzhhn21XA63VfltYlV+HtokkJHp8IpvqACpMrer2ZkoJjplGn8uQMTaAOtpQZ4OleVJ8l4D5XvhloAj2yDgEQsGsY7mEcW8NDj88UBGlBfavYqVmr6l4VBsEBY7FndrNGXzp4lErAF1TRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CVPRk3MB; arc=fail smtp.client-ip=52.103.67.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CVPRk3MB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YscJFZ3dVdgB9iz58e/Uz7PtM4iNFhDJ2f5cSNDjPZoq/OBSz++0aWF67XSCSdSkQxTyBGHX4DOkM0sKg7RfgoRCb3xhakgP/mBA2cSB4kRBSjnfFfAIYCjKV8g0QMU3cRwqY2LuONsAb78ikvNv/1BNyvDGtb9r6Smwfj8fv1wK585FFQAPVQRRt522BVwn0vX2TwMM7Jyet7QlavsF48oNN7YBeorKxW4vRmUO21FzxNrvIHLDLPPi/lJvGCiqY6pUKjeGochVU/pjcqbnrtFlIU9hcGnInlZJtFOxxOQ5TWBmidT08B0ztId3/ZuUC7DBl00jZsKM0UVs0WFpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7xKMn/Ow3aWddRtx+/oFMF1zpT4qIZdvl3U1XWaZj4=;
 b=vras/FDFGDdQWXmonwlv94I1AF0sCyL3Baakz8CUTz+Y/ZA2HxvLdI74jiBP/v3T1VASZkWQU5w8k8Y0HGQh141wVPs7Ziw/oZjbEV77evGXHH2EuyJuz0INxc3wbwQ7BYNO2QnLrK5Uzfh1GfL51jnDeM1hCzyQDAJ/cbmOsmtvpc8afntQNZUI4POwhG7cT4NcLipA5akgl0IyZL1oVvFHItdLB3RJsMj5qD20cnhlFxiPDAW03lGDmHv3i3RndYlyuesLwAmvj03tWL62HKMwF7pFha1qhPhiOms5uqaTRbMaoBsjAAydKyMg0dTLl90Ttee8toxTsSkvD4Potw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7xKMn/Ow3aWddRtx+/oFMF1zpT4qIZdvl3U1XWaZj4=;
 b=CVPRk3MB1D8DFUBmB+RWKmEd3QBtwB31KQM0pPhT/jhNKnrXEBgZTR6umGwyGh/1xbjHZOn9dIW/FGLtwf1ntkeOjqqFfVLTtPlFqnJ8e0BlWghd/5YGbVblI4dhyaDsZV7kv1Lv1U+5JYJXDHId3tKsXTKaLQyCcZ2nibTwTGMPYifVDxjFOIJfbXEq/4S2gZ0hkYE7RnIP18q5P8XZdQ/vk60oNM4p3WorSR6Zh/kOHehr8Leizug2KNaptTw0K5BgJ6zDyJiaERFQhpRjp5wM5ekcRu4xEDuckxUJNgK8KzL5wDlxIwx0DOHUpxSdw9pJTJFXArbHRVkUfEsarA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN4PR01MB11570.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2de::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 06:42:03 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%5]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 06:42:03 +0000
Message-ID:
 <MAUPR01MB11072863D4DA3440AB868C22CFE1BA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 29 Sep 2025 14:41:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add initial Milk-V Duo S board support
To: Joshua Milas <josh.milas@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@gmail.com,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
References: <20250927173619.89768-1-josh.milas@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250927173619.89768-1-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21)
 To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <9faf5137-db77-4f9d-a958-1b186644172d@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN4PR01MB11570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be2ff39-6b29-478d-889a-08ddff234c42
X-MS-Exchange-SLBlob-MailProps:
	7J/vb0KDx3idnJD6lc/nqZLIFT+Fye11XSortVnbjcq1IgUdm8aUBOUkCIw63jLYYoY3Amz80RDk+USksgX72JVHiYpCJUfhClKH3JhWd2jVvveVkzpla+0zSV6Z0Rggf+xyTOxzMekSKQOi1XLFZ84t0hGYJ4yTPzcjzKcAsYH+JHXOwvp6wSZrbRsmhnf4Ou0bODT7zhhL7CWvy0oXXR1VNUMpMb48uCwi+dguqhmz4uXKa4dFGTyABF6o9ljddEv31yhrWxjPMY+OusirPnN14qjwB6y6S2ws/WVFg9C2KnMfPTGyzmSOGNUMCLJniHvKMVjbNNH1LQekibtuw2L3TlZupdC5WEJqmBN8U1MuvmkJnlZt7qbC6QKfmpf7orTbkL3qdIOQPcYCEHiyebyVUVumcihKTi+EgjI4Co/rebnMcnB985voyI4xkm3uvvRCKe60koPIIJXrwFXiSi6UVRAAdcixFxNSdirFLhPuJbzeNDwTPeztBmhF54pNS28WwBU5Q9UTi/eAQG0Rx9/LI7DZXzYuDBEWwVxuvcMxNl/1werYzvVjrLZ6FhBnu+euOFLU3zKOsqkMizESk4X6Vxgd/gSEMnRGlbrM7tUMb0LOfhLdd+Rluuc7xJ7H4DJmMZ58nK+5vyowBHX5qBxRI1rUKZyaz/qskEOtd3MqJVSby+dHp7pSF03ENDJr3/mwxphuasqSSjWSKtxY9lPnS/bRHIhxDrg5rYUR+5hx/lpKSu2tPqsLZenRKriqGsCl4CYcRwKTcg776CU0yuNi9kcNMJcdysRtjj7mH9s=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|23021999003|19110799012|5072599009|15080799012|461199028|6090799003|1602099012|53005399003|40105399003|440099028|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2FnNTlBbktFL3J1dmNuUi9taXlqZjF1dFNJcDlhUjcxbDB1Skx2NFdZQkpa?=
 =?utf-8?B?elZpY2I5ckltQ085M1Nxd09xSS93R0RXY05kSkZMRTBYcDRrRzJWc1plSkdo?=
 =?utf-8?B?dHUwRS9DTnVkbUFydEw1WHlkTmxQRkJXWE54bkpSMCtmUlFXVUU5ZzBnN1Fn?=
 =?utf-8?B?SEdVVTlaNHR2ZGphVE5pTlA1c2xSOE02N0Y2ZXZxTzYwdSs2SnpTanlzZGNp?=
 =?utf-8?B?cVZzNWVUdGJTMHhpRzlWKzdlM0M1SnYwREQ4T2hEcGNaZUpVd0FqUkVFNTZz?=
 =?utf-8?B?NzJxQ3pEWVpVTW1tenJTOGVzbVRvcm81UEJ0R2tqNTJNS1FIbUliTlRkcE8v?=
 =?utf-8?B?TmZ3Tlo2WlZJRXBPV0N0MG1DWVpLRmhBR2JCbUZqd2NWcDdicytXWWlSZ1VC?=
 =?utf-8?B?L1RoUElkMHVPdG9ZWFRGajRzWlNaK2tMY1BTZ044Y2NvZ0piaWFNVlVWN2xC?=
 =?utf-8?B?RG9xeTJ4UWdhQmlJb3BISDc0TnE0WkZMUm12TkFrenpjK2lQdktRNCtDY3Vn?=
 =?utf-8?B?bmYvZHhONHN6NmpjdEIzT3VZSGVhc05RSWlDaGtuUXRLb05jQjRsdXM4QUdv?=
 =?utf-8?B?OUgrejg0eHZsQzkzNVRVQzVGSlpJTmdVU09sWUdUK0gwbDN0b2dnNTRsNzdL?=
 =?utf-8?B?S1RUR1RhT0N1TFhjdDMyUVpmTEhtajN2NUlzS0l4R3RzdmJJZFQ2VDFCdjhX?=
 =?utf-8?B?MWw2NVdWbW5idTF4SjE3ak5vSzRoM3lLZ1BJdWxzc2JMOGJPb3pGV09vcHRS?=
 =?utf-8?B?YWNCM2Irb0RDVjNtUzZpL2prUWI1ZVduUVNHbDlUUWRzUDJDT2NGdFR2OHRo?=
 =?utf-8?B?VTZ4dVNBSmRpQnFveUJJM1NRVkNuUEF2VUlldkl5YkdtNHhjWjAxRndoajVQ?=
 =?utf-8?B?VWNHS0tPWlJsNVdFRXQxY1AxdW1Va01JcktZVzZHZUVuMVVTV0ZpaUZnQXQv?=
 =?utf-8?B?cUpTaURUbXZXdjRJYXY3dHBkeW9NaFhmY1NrWUR1aStZZjdPdmdBU2p0NkVX?=
 =?utf-8?B?MDd1azd5bGlSY2FXWUNBSi9ZUk9saXdMcGJmR0czSzhPQXlIZnFLcjJua0ww?=
 =?utf-8?B?NmxQYnRvVTR1bjRUcTFCQWhRTFFLUVdxUXZSdGRNQUtuK0pFSkdvT3lUSmw0?=
 =?utf-8?B?QUY0S1gxQmxxcVh3S2ZRdjNHbGYzbm5MOHd6WVN5eWJmR1JCL3NDblRIUGh2?=
 =?utf-8?B?TGFyWm9NZlN0NVkxWFZ3ZjNlQWkzbU9BejJwVVFIY3diTDVDRFoybVF4YTRT?=
 =?utf-8?B?LzFwcGdMK3lwNld4aWN4R2dPZHV0UW1yQk9IaS9oN2dPbVN3TjM1MUxGQzJH?=
 =?utf-8?B?ZGl6emZwWmpLSlIwZzhTOUNuTXdNYzBVSDlPbUZINTNsZ3VwdkJTL2dJRUIx?=
 =?utf-8?B?dldPUUVLMDJucGwrVVpDUjI0TmNqUjA2SWFlRlFmZjN5TjM0T1Rja0pJRTlH?=
 =?utf-8?B?QWZaUk1ja2x3VzAwZmhYbTdpanZSQlFZall6LzFBaHUxUzJHNzQ1dFRWN2Yy?=
 =?utf-8?B?Z1hvUUg1WTU1Z0Q2RWxXSEovMFhUS1psUmpqWkM3MHY1SXJKZFRVNmFKa3lH?=
 =?utf-8?B?NlhtWVdFMXJsNW01K0pSYW53enRscDJlOWp0Z2F3STRIbnJRVFdwQmtVTG9y?=
 =?utf-8?B?Z0lPb2x6TmlPTTNWOEVKS0hPWGdqNjRYZDdYUFlYRGJwK0d5cUVhd2RJTWJV?=
 =?utf-8?B?UXU1b05zMFVkdHpOTHhsZ0lIZzB4RzdyTHJUd3Y3SmdIWmRGemphQXdpMFh2?=
 =?utf-8?B?YXhEVEt5SDBVeWwxWGNwU1NrcUE1MnNPcUl4M3F5amtoWjlhMWQ0cFB3Rnh3?=
 =?utf-8?B?ZFBKd01oSnVrcWh2WWIyQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdYdFloOUQ3S1J2M3l2ZGsvUS9FOHJLNnhOOUxrVEtrRTZodTBsZGZicUgw?=
 =?utf-8?B?R0E1UHZEczV3Mjc1U2N2ZlZxZklUMm1hOHJHblJWWEd6ZHlieVdLb3Jac2ZK?=
 =?utf-8?B?U2V5MHRsREluYWF3QnpIWi9hNFVUR3ZmL0pqV2pFWTlrYmZCYmpQbmVxQ1Zi?=
 =?utf-8?B?MUh6ZW1qdElkU1JRYjFMVUdVRk02ZVV0bDVodTZrRkp0bVpWNk9GR29CQnFQ?=
 =?utf-8?B?bURtekp5V1JjV0ZXZGlEaGpoN2dSVG1QM09oZEg2RFlNb0krK254L0tlSzhU?=
 =?utf-8?B?TGZGVmhHaDlqWFFScmRhclNRQWJQTzdIb2wzalRDNXhva3cwd1FWSTMwZy8r?=
 =?utf-8?B?MDRSeExhTUNXMzdhTGpxaTFjVjBlaUQrY0ttZzJuVDFDc3Ezb1kzOHdyWjBP?=
 =?utf-8?B?dyt4Z0pSVUwwRUl2c0Nncy9ybVVQSTdFalU4SFJYVVJzdjFhN0ZETnh0T2xF?=
 =?utf-8?B?MTVGellZQTdENDd3SkI5c3dRN3RLWnFvTWNUNnJ0NWhaSWVMa2hnb2xsRWFi?=
 =?utf-8?B?T1pZd1hFUXBvQ1QreXFrVmZROWt3bDVpNU91V0luL0RyalJjVzVpVFErVjV2?=
 =?utf-8?B?VkJidWhLL2xXU3QrbFJKYW41MnJHc1NyVVhFRGRMUGVHMmtVMTh4SHZPalB3?=
 =?utf-8?B?eFN6THJUMUdvZlhsZGsxQVI5SUprTGU4aitkWTZ1QUJTblliaFBYZUxsUzQ3?=
 =?utf-8?B?Z29XTE1wRmo4T25McFpnNVg0Sko4TDNkRWRSQ2cxbE5DQXZpT1AxK3lleThx?=
 =?utf-8?B?TmhabW15SUdUWGpNNTZSU0pQWkVCNzcwUUF1MWhlVHB1czdpR0g0dWsrdVow?=
 =?utf-8?B?QWZzV2ZWTTU1OHozRHR1c0trUmN3OXNwYmdOMkFVQjNUTkgwSjBLQUxvYkJG?=
 =?utf-8?B?bkxLNkcyNUpoblc5NWZsVGNwY2Yvb3BxdmZqdDlBcU9vc3NGNWxjU0lIcjRP?=
 =?utf-8?B?Z3JVeVRMRlJGY1J4eDZBOW9PV2dLMUZiQ1BtQW1nbU8xSVdCK3NnTSs3QlYw?=
 =?utf-8?B?NVM4TUhLMHRSWXZpbVA0WXFQYm5wcXoyUzdaSHI5RnJGbkNPVjNqUW5NVVFh?=
 =?utf-8?B?ZzNNdkNkYndnR2Y0Q3I2MGZBOUtzOXFtZEh0QURqQ2x5SGhTWmQ2cVphaFJG?=
 =?utf-8?B?YWF3bmkwa1pPZGxnQWJvRmhORUtBemczZ1lxcDRoRWZqYUkyTWRjUENDZ0V2?=
 =?utf-8?B?T3F0Y3UrUnR6T3pXSDlzMnZreE0vL1QrNFFNTUtMK2tLUmIySkcvdng2NURs?=
 =?utf-8?B?aG0wbkJUV2xiazNkMzBUVS9ueElqWXhXaFdnbklsWDdMNjNuYm1uQlllSmtP?=
 =?utf-8?B?WVBkMnhFa2pFTVVKc0JrSGlDQ3RXMUM3YkJDTjZxbHVXejFOY0pZdnZPaUZl?=
 =?utf-8?B?MFU5Y1loUW52QmFTeGtPbEVwRzZSOUJqZ2pySGFKN3BndExZYld0Nit0cTRj?=
 =?utf-8?B?cDRlQzJWTkxqQ1JaUUVBaWxDakZiaEtsVFJtdHBjRHNpVTBGU01rbVNkWEt6?=
 =?utf-8?B?QlpvRldOZlM2VTAyaXJFRWFqQllXRUlzdFhtYWc3NFdsWDVNclNsR2YwdFRa?=
 =?utf-8?B?aFljU2FNUkZkS3E4QVRvV1I1TzJJUHBUb0hTUUxGeTFDYjZLY1RFdW5jZmth?=
 =?utf-8?B?V05oaVpVWktzZTFZbVpkUVVydWlYVk5HMCtwdFZCcGxVVUdqZnpDZ3pjYlE0?=
 =?utf-8?B?OEZMRGpwRkJXREZEKzVma1VCeGtFcVI2QmJqYzRvMmFBQTBzcFQ4UU03bTU2?=
 =?utf-8?Q?MYM5pEM8zzDSuEYoLllPXiD+QJh07J96VWo17Zo?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be2ff39-6b29-478d-889a-08ddff234c42
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:42:02.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4PR01MB11570

Hi, Joshua,

Thanks for your post, please loop to linux-riscv@lists.infradead.org 
next time.

On 9/28/2025 1:36 AM, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card. This is continued
> work from Michael Opdenacker's v6 series on the ARM64 side.
> I'm still working on confirming the RISCV side.
>
> https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/

Please add prefix & reference number as below:

Link: 
https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ 
[1]

And you can refer the link as "[1]" in your text.

>
> Patch produced against the "for-next" branch of the sophgo "linux" tree:
> https://github.com/sophgo/linux.git
>
> Joshua Milas (2):
>    dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>    arm64: dts: sophgo: add initial Milk-V Duo S board support
>
>   .../bindings/soc/sophgo/sophgo.yaml           |  1 +
>   arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>   .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
>   3 files changed, 90 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

Regards,

Chen


