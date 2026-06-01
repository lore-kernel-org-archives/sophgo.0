Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010015.outbound.protection.outlook.com [52.103.68.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D83264D5
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300817; cv=fail; b=QFgA5SC5yIln8e/aWajBjd6Iex/nxq4DCePFZJVGTYhr3Ajjgr8qjpZoBh9EQD360geaguGluP4o5+bscCj3OB8VY9TZduVi5Gzkl+YIA3B2DzBfuxTgsTq8z1d3MC3VPneq+urkSprUdMS+1VJd3FCWb+ZM4IKVkaQcgrymZRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300817; c=relaxed/simple;
	bh=Mu6lKHxTMJZlnVvCXBLGlsrMqi3G8gv9inCC7bTE/OU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gbwrhDBbmAUHdUDw9+ZrCvNaDXr04Oh/YwEVob/frnQOqTQqvvGXtVfzi34NOXhbgr01Vxf1mu/68jI2bja/MniYhdvJcbP2nJbBejcbkzcdJ+RPfziJUpG33dgpxQ7f5Q0x3xkw8RChZIiLBSlgHPrCRSE6zRrdVqlMGW4qz6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hxCNleYj; arc=fail smtp.client-ip=52.103.68.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hxCNleYj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dm069aEF96qcAqL3lP3QNVjcj1OfjD6dERVaDI+H2yAqVlUYp7Qfv5osc6GZjcSVAF46G35+eYNu6SXxR79V3gGscFJroaC6XJDyRIey53boSGWfJSpVuLi/eALXQ5z5EYCqAh3TeVST7aYXX2bNrRZGTjSrhR6hKQ/4HdKx2Zpa2fQ4meSXYlBW1yIhonEkGU29eZ6RW1Auy1Zl1eOvubWyLdywG/ruX2T0X4hztzIub21Paxyzzrsod9oukPk/qtnGGLIhUMGrDqTnILfQ3mzozCPF1SN3I4sJy/ttlTke2pBynGs2ZsoUEd3n3NhSbNVTIbiLK4gZgDV/xFs32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZKX6ayjpr9sigWKbjdD6GH6yG5P3n6Co/BXzFl7byE=;
 b=Z2pSmTEHjT3Q+ZSfWTKgu/awZWRa52rs0JXy2ogYfMzmd9G6MYdRMz4nMdKtOlZ2HiGtV87XOL4FQMKko2S6QwYp+d/11f6q5ECDicc60v2rxzsW1Fca3hdmVALo5eZ6VvH9ZJiksmjF8KTdrKEfeHW2HJqJfPpTgJb5ZxDA8z2E25FBFvKdltR7XArW3OXZjNcH0Hmf7ztApw7/SCCY3EW+fkUoYekNcBRm1XToz8+/3Hd9EcjO728p7OjvwxnBkm8QQsh3KVxYbxeYqltTA0rVaPaxg75/qOMXIdYvCYmpleoN+xcZPIM4ukU/szqeCNkQqQ9SC4n3eDi7Ab1f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZKX6ayjpr9sigWKbjdD6GH6yG5P3n6Co/BXzFl7byE=;
 b=hxCNleYjy5otHzrpgQgEytVqRW0+IYqP2qCCD+WCywPnsJ/7arNsprcvKT05G+QCR0/thtdUDB2YJaW335BSzGfaUSDe/hI/RcdACnhNH7Q1zaqHgc8nnM2Mbp5L7tig4hAcD4INFGMOPnA31Z6w49Mbzm6k9CoIFRPk7q8FyABDKNuvFT9Fsl+oQv8jqtzJZRyzpaJt/w9ULJ0tEcrC99mnMRVPcr76vZ+RfTEDFEWIItAiLEfdEWNkRWMaN39IEQlRbexelbiqW6ci+tcpdfI3OUPZkht2aeyXtIyjGBS4v6aqacgt5M7DOLdZTuZ9Li0lpxf9vL2446lt+8ge8w==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PNXPR01MB7418.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 08:00:09 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 08:00:09 +0000
Message-ID:
 <MA5PR01MB1250071E879EDEC8ED3A29813FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 1 Jun 2026 16:00:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: SG2042 SATA (DMA?) issues
To: Michael Orlitzky <michael@orlitzky.com>
Cc: sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>,
 Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>
References: <ahu57vcS0oOFmCI9@mertle> <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ahzs8MSmNU7_vsIT@mertle>
 <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ah0rA-c34RLkHWYt@mertle>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ah0rA-c34RLkHWYt@mertle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0074.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::6) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <49b2e556-5f0d-499d-bc0a-a0697e2967ca@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PNXPR01MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 39161e51-34c0-4ef3-89b6-08debfb3ccbb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|23021999003|6090799003|22091999003|5072599009|15080799012|24021099003|25031999004|24121999003|13031999006|10035399007|4302099013|440099028|3412199025|40105399003|52005399003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVk5NCtLZU9kaVVTem1VVTBZUDU1R0dZMlNZME5BMnlMNm5Ra21kQmZValBx?=
 =?utf-8?B?VDVpbGo4WUhhN2QvL0ZHSEFMRVlQU2lHTTJ4NmVqOXJBSjhObFlwZXpaWmdn?=
 =?utf-8?B?amFIR1JWc1lROHV4N0lWWE1NTTJvdFZ0eGNBWkxXcllCMElhSnRSSVBNeWxG?=
 =?utf-8?B?UGtoVlpldm15UE5TTGlMZjVMYk5UbVpWRzlJYzhlUFZZR3RmdThxVjIzNFI2?=
 =?utf-8?B?OWR0aGZjb2w2aTZ6TVFpTnQ0RjVKdndXa0Y2ejhYQXJxc3JYY0hHVm1mdVNw?=
 =?utf-8?B?a2lCL0lCblQvZTJMY2ZaMzdSbVNST2pZTHFmaUpXWEd1YWx2M1N6YTlyL2JX?=
 =?utf-8?B?RE5HbjJmZDF5MW5GaklQenhjdEU0UTJkZ0tpL3ZOWTNKaFFhbk94VVdMUmJ5?=
 =?utf-8?B?S3VwR1JOWXArWS9COWw3NU9iWTJ6RmxLM3JWREtOY1pGS2dQK1EvY3lnMGNl?=
 =?utf-8?B?c3phRG1DblRhYkY1eHFIdUdNY0JBRFBVcmpoN1dvUWdaMS8wR20zUlQvYXI1?=
 =?utf-8?B?K3d2dXpuVzVWeUtFOWplQzl0cC9zNkJyOUVRcXNlLzRZU0JKSnBhOEFVVFBP?=
 =?utf-8?B?QUVJc1NDQjkweEVuYkNPc0s4cTR0aGpwbDIyUVVnK2toeGMyRTQ4MzJqbzE0?=
 =?utf-8?B?dDFrL25WQnJ3MmFnR3ZJWEI5YlgzR2dDUStnUjg0SFA5Ry9PZG5ydkpRRVEz?=
 =?utf-8?B?VE85eUdSZ3RlUjc1R1hMbGN1RmNjZGhOQmthRS9obSs2MVc3cFhpcVVNbVZq?=
 =?utf-8?B?dzFrOUpTNXhmZy95UDhZOWt4L2VlUlppNnV6REFjM2hRbkt2MHg5ckxMckhv?=
 =?utf-8?B?QS9LRjRwNElVNG9DbTNNME1UR2pDb09lZmxiU1gwbzFVOEM3YXFUSml6bjk0?=
 =?utf-8?B?WUpRZVVQVmpTNzhCN3lEN2FwallQWGZqSXVKMk1MRlQ3T204ZFFqR0p3R1A2?=
 =?utf-8?B?dTZObDJqSlRXV28vTW1sTUYrRXJpYzJBcjRzODJVa1pCSSs4K2plWkR2Qnda?=
 =?utf-8?B?aVd2K1U2bEY2d3RIZG0zSjBZeWVUVERLT21xcGtJL2VrTFJvZVd4djNITmxw?=
 =?utf-8?B?YTFuV3RHLzhieGN3dXlTTnNBSS9BRTV3ZzNYYXFKQk5XaHRGNnk5ODVQR2Zl?=
 =?utf-8?B?djREcG1oUDBqSUtYMWVjZmVGOFU5RXNZTnBiQjZlYVJjYmcyTzZCdUJOclZR?=
 =?utf-8?B?eFN0ajJONm1RcXdEU2NJbHpGMUoyNHV2QnFQMjRiYVRVenVlcGFoUUJWdnhV?=
 =?utf-8?B?cVdYZXBjQ2RDQUNmVWp4ekJkUE5HZHRlQ2lzekxITG9TYzJwU2puNURZaWI1?=
 =?utf-8?B?WnVOc2xpblhVeTBBTGpGa2ROSmVMcUJxK0c2WjJZOFJOcERHRHNCb0FzaW5N?=
 =?utf-8?B?MU5qT2FvV1RTYnhQWFdlV24zek5XdGdHdGVQbWRldW9nd0RCa0k4bkFHMlBI?=
 =?utf-8?B?NWZnOWlnSTFwd2kwdzZtSzJVK3ZGcGNsWjBua3VtWVJoY01YWEs5SXhIc2ZE?=
 =?utf-8?B?L3V6TmFYUHdGbGRQZjFMQ0txcDRXd21SQjBzdGZVR1RUQmxGcjhlWXEyRjM5?=
 =?utf-8?Q?9Ge2X3lxO0UK4L1nFogrwUTb96AZluNTG5k1QuKuNX2Ipg?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N21aQmVRTEwyMkN4bHhpaVh2TFBKSiswZW5nY1B0NEU5SG5TTzdiVGdwK1Yw?=
 =?utf-8?B?ZGdyVjBGSGdLL0ZHMS9IbW9EUTlPenQvRFdONkFQOGtJQjJPdWVSbjJPU1Na?=
 =?utf-8?B?UU9yK2pZQzZwR21yQkg5VktEcFJWTmorS1ZFMmxKUVRoSDJsTThaV0NNWnpD?=
 =?utf-8?B?cVg0ZmtZdnJwS2s1dFJwOTUzdzAwZnk2NU1pR0VOTkxDeW5hY0xvRWQ4TDEr?=
 =?utf-8?B?NTE4NlA3dVowMTR3ZStRZDEwMWQwSmhNZnBGY2tBcm53QkFDaXQ1M2p1dmxx?=
 =?utf-8?B?Y210NFBOZFVVZkxzZG1DbldhSGYwdFpaekJsUldqOHJRMmNGU1lKWU9wT1E4?=
 =?utf-8?B?VUplWjVSak9KU0ZjRkx2czcrbmdZTS9NV0FtRkNiSEE4ZUg3ZFZweEFkUEly?=
 =?utf-8?B?OXZGZEk1aUl5QW5QYm1mek5paUdBYkNzNk9odnBaM1hDckdhZHZ5d2dZU2Q0?=
 =?utf-8?B?aEpuejF5K0pnMHJNa0ZvbHhWdHVhM3dabFNNaDRER3pzTEtkTFFDVmdNZ2FG?=
 =?utf-8?B?OGF6a0pNdnB6M3FyZTI4U3g2QjN6RGRqS3ZsdDU2VXdDdXJLTk4zNXBkS29z?=
 =?utf-8?B?Wmd1ekY3N1Y4SDFCS2RtYXI5SnN6R3FrRzNyNGxWRG1wWTRzcU03MVFFNE1M?=
 =?utf-8?B?QStpNE9Sclc1dTVmbkNUL3NGNVY4K3V6VFBldFJ3S1pQU2RxbjJXdk1UQ2pz?=
 =?utf-8?B?N2huSUV0UXhVckN6MXU1Vm5ucy9RMjFCcW9jUnRYQkloeTdhY1RRa2EyVDdl?=
 =?utf-8?B?ZnJFT2x1bk4rZnp4dlRQd2c5dDg4K0tsVlZVSFl4SndsSzVQWVZjSXJiYWVk?=
 =?utf-8?B?UFJDbmFPU2VReXErMjRnZGNHdnF5U3ZkblkvL2txNHBHYzQwazJNUkFQd2J5?=
 =?utf-8?B?bEpFb3NWMi8vbmVCZmJ1R3FmeXdEck12bnI0M0h5NE5MWVRGUG1OWFl1ckZy?=
 =?utf-8?B?SGxYZHZhcXE0YkYzZE52QmtCS3dNS1YwWEI2OU9ZQ0c4c29YQ3dFOGkycFB3?=
 =?utf-8?B?b0owUU5FRk40V01Lc05MZktqWDNia1YyZFkzL2xKMlpSUEhsRWFkUW5EcFZB?=
 =?utf-8?B?Mzhrc1hlN0JyOS9UUHljN1Vtd2VQTDByVlNod01yWXgydTlKQ3pBNG5Wa0Qy?=
 =?utf-8?B?eHpJc21lNGk3amxIY2toV2h6Q3RZRktFUHBWaGZQYTBJMGRvL1MzZzViWmkz?=
 =?utf-8?B?czZCZ29xcnlvNTJKSTZuQVE4eklmN2hiK3ErVE5qclV1bTQvc3VHbU9oSkxI?=
 =?utf-8?B?NDBRVUc5RmFHVk1TcE16Unk3UHBGRnd5N1pCVmVYMisxSHZ6QUp4MDArYU5R?=
 =?utf-8?B?MktnYXdWT0ErUTZPUmJ2dWttTkY2QzhIOElDajdkZXF1bEIvL3pBWGdaV2Vl?=
 =?utf-8?B?dTJ5cEVWVStudUtxTFRmTjBSYW5KNnk0cVc1YzNKZy9iaUFIZG5naHZqZnF1?=
 =?utf-8?B?TjF5cW10RHZjNFJ3WTlRTjBoZFdraWxNQ05lT2xPNUdMVHRhNjdVS3RaWUZ5?=
 =?utf-8?B?VWxxRGNzN1FuTGxvSUgwZlphK0xieUFsNnhIQ0wwV2s1NU5tWll5NHBGalBL?=
 =?utf-8?B?d2JTM2pOUmw2ckY0bTFKd3ZMWXpCOFhlTmtuVy9Ra0NqWWVKYzV3dGhBM0l5?=
 =?utf-8?B?WUdpU2FTVTU0K2REdkpWZnl1Si9wWTgyYXNRd1JScm1kdVZuTGV4L3NpY05k?=
 =?utf-8?B?dTBpZERDSXYxWk9neW1CUVVHMmZjaHFzeVRkdThOWUNwQXJWTkdBOGN1cSs0?=
 =?utf-8?B?SUZIWjN5YmlwTU5wd21BSXZLYW9SQUZxcW10QkpYRXdEdUlqNWFvbGlpZlFt?=
 =?utf-8?B?QVhqdHpvK1dzM3ZYZTVJdjZqbVIxKzdNTFIxdXNPQVNQYytDdzFRK08yNWxT?=
 =?utf-8?B?UEZKTlAvMm04RVRPalZSTzJXZk8zdkJqNkxBUFZFNGVXOXJoMFRTREszWDRj?=
 =?utf-8?Q?aWP9LA4794347z+9/eba8IOafT/Xi1WM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39161e51-34c0-4ef3-89b6-08debfb3ccbb
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:00:09.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7418

Hi，Mike，

On 6/1/2026 2:47 PM, Michael Orlitzky wrote:
> On 2026-06-01 14:06:29, Chen Wang wrote:
>>>     * SRA1-20.fd (20251209)
>>>     * fip.bin (20251209, from the bootloader-riscv repo)
>>>     * fw_dynamic.bin (20251106)
>>>     * zsbl.bin (20251215)
>>>     * mango-milkv-pioneer.dtb (20251215)
>> Are these firmware components correspond to the https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36?
> The dates listed above are before any dma-coherent patches. This set
> of firmware files is OK, no filesystem corruption.
>
>
>> Just want to double-confirm if we use
>> https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
>> plus the dts dma-coherenet patch, how the SATA works?
> The older firmware, without the patch, works. It is the newer firmware
> (plus the dma-coherent patch) that appears to cause the problem.

I'm a little confused about what you mean by "newer firmware." Do you 
mean >= 017a5aea or > 017a5aea?

Because in your last email you mentioned you discovered the problem 
starting with b379b067.

The firmware's tree log is as follows:

https://github.com/sophgo/edk2-non-osi/commits/devel-sg2042/

latest commit

.
b379b067
017a5aea <---- dma-coherenet patch was submitted together with this commit.
.... older commit




