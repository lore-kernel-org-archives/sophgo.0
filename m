Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010010.outbound.protection.outlook.com [52.103.67.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44F36B
	for <sophgo@lists.linux.dev>; Sun, 24 Aug 2025 00:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755994552; cv=fail; b=BLNiIFXqhgd8aPBYH9ax/i/g4u6BUc+48UuI73dGEG7uXzU7/FHJUFxEiN2Sy/1fh8eUyPxT7CiLH+07VITv6ZXiKNvOHiviE/iZrqla2SYenDHJn0k3j68aB5Rl8/qGH1z+pXZjnZWDtYf/b5aaK5jPTqldIj/Zm2DJbOXd970=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755994552; c=relaxed/simple;
	bh=8AkZQ04ZamlLu8pc+j54MLRqHOhRuYfGWJdpAl1kJIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=unBl42sJlaMQxnC2vhs9f1TEQJms8HsVVZZTdE22Qnps0vhvoG65+IEpbdBzlSi5BojcwwD1sSp5eAWMQewc1UnvfDZn9fEDK4G1MLDkTsjPrC4rhSW/qHi2iGIk9/17z9YXTiAAqWjxDhX1Zi6iYnv42abKgcHw+R+7XN/iY4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cWSJcdUy; arc=fail smtp.client-ip=52.103.67.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cWSJcdUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNo8zPG/4UVkSKd2j3JyxXypa/+f6MvaDZQlJnJEOkryzkOjqcW2AaM1l6DpAAxs5m9XnA76vfRC+1nW6preA2/IXj5RbydZ89lBPzC1OR/OwhBCAiy1PQqiDOhNVK2GYDXL0CbFiodgxsf7jyDFwU6kTP9vIVS8rEgMiT09bFPZMV6LtXzf48K1klKcxejsHsL3zIHB9qAVuahJUTNdhtew5Cg2uMQdvD9hXbE1ThJuhX3B+spp9ps0W444IUNcddOmSmLtvI7J0dcs2MOoe3PWEsHvGlQM6tgUivbyS2w8m3tgs+j2a9Kuf9kejwlZwryUak/ZmU8CGvyqdOlthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UM3dXORwc83GCg1YjigkmD+0NvWm2PvXAmk4SxRm5E=;
 b=MC7l3JOZRPl8oTfO7z5Jpm3YcAk/muwsFQKSKY8tCZUSZ3k4WJxmw3znz/twjcUotRCMwRZ17HF4beG5nZCVhA52a543o5xzFn0noXD7t74PO6ETkx+gPXPHrHX+CmHUngHujVs1ngdO3jhFsfgOk3jqJq2vLi6pE+FKri2eBoaCuow1C26Ut0AHJ663QU8LFXrEr7HQfstPOVW+N4eL4Wt0RCWvCv0sxX4X1EfuHAWVzrXBqHOsK5TPt0d64Vf0Np09ZJpKK1ppTyjcN3ms+acpFEMBgi5ms5UKIoNL3tUlv38+n/JinTvcmKrQGJq5hqz6irw9GTImJJhroDe3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UM3dXORwc83GCg1YjigkmD+0NvWm2PvXAmk4SxRm5E=;
 b=cWSJcdUy1Cwoz2Jyr2rPziq4xc/JkDRo8TGZt7XMx+71JkoBzJMIOzEpWtjNKmu7RkElKUVLl8HiGq745DQXPY9korpqF0zafSrvqn/iKxl1lw3VQ9h9dogkwaelTZuIE8A0RqCg5T0CRuRVDaAcUuleYMm/Rm0SZCS8xUc/UA9wNfeDtDbRyF6n/BxIsDBAcGOwiWeKWYgYMKkZy+BiuZ3m9yhoiy3+IxhMO3c91cR5FNi9yLjhZdxwxU5N2CVdFsc7L69nahhQ9ReWm8SM9l3jfBvD5Vu+LQabAGQvmgu0EBih3lofLmxwvbjxFaGXShCCNr/vOFHiLcBlko5tcQ==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN2PPF7433D3F05.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::1b3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 00:15:43 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 00:15:43 +0000
Message-ID:
 <MAUPR01MB110725231A38B713C7F3C3FE5FE3FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Sun, 24 Aug 2025 08:15:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [sophgo/linux] SPI transfer timed out when there's more than two
 cs pin (Issue #3)
To: sophgo/linux
 <reply+AAS4RBLPTSIZNJG5IFNAFKGGWYALLEVBNHHMPGPAFM@reply.github.com>,
 sodo <notifications@github.com>, sophgo/linux <linux@noreply.github.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Cc: Subscribed <subscribed@noreply.github.com>
References: <sophgo/linux/issues/3@github.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <sophgo/linux/issues/3@github.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <56fdf200-d004-44e7-9b61-71f0bbdeef08@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN2PPF7433D3F05:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa41a3d-3bc6-4e7e-e2a7-08dde2a35d6f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|11091999009|15080799012|461199028|5072599009|41001999006|23021999003|8060799015|19110799012|6090799003|56899033|1602099012|4302099013|3412199025|440099028|39105399003|40105399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlpmZ0xjaTIrZ0l2RWI2YjdQTjN6ZFJwUkdSMGY5QkJPTCsxQ012bHdpZUFL?=
 =?utf-8?B?cmNGbm5ESEk0dTVSYzlhVUQ3WUVFanMwL1pNaGN2NHUza0IzZXJIbGlYMS92?=
 =?utf-8?B?cDlHYTcwZ090TFZ0cmgzOWxlZDVRQjBaVzZBYTI2M2hOSWVHQUhENlFDdkh3?=
 =?utf-8?B?dGJoTzdnWGtQblIzVFhtWGxkQVJHRll6SDVDVXdrelE2Mi9JTXhNMzhpcmlM?=
 =?utf-8?B?ZVU2NVRZelRnT0xlYmdvSFRoNDNGRXk5RTBoTmRzQ25laVQyZTdRUEpSU0hQ?=
 =?utf-8?B?NnZaTkVYY29tbDVTQWR3VlNWYThWTldMNHdXeXhCZTRpRGszcU9pNmtzdlBM?=
 =?utf-8?B?Y3NnRTd4b0dXWlNVcGF3MndqY1U2dEpNY0s1aDltV05VQTE5NTBsTTJLUi9P?=
 =?utf-8?B?NXA4TDhocEd2RXg5dHVtS0FLMjgyQTFtSEdKMnlYLzF4OXNZZWhXd1JLMC9h?=
 =?utf-8?B?cFdFQTFmcUt5VUo1UGpZU1crNm1qSCtYTWVPK3l5NEQ0T2VNbFBSL1VBUEdt?=
 =?utf-8?B?bkE2SjFMcVI1RUZjRmI3VWRrN01URDBVbTVsYVFqV0QwRUdBbVEwMUpBeENL?=
 =?utf-8?B?L0RuKzFxZlpCaU5xVVNmMWhWQ2lSVUVKVjdwRGZ6VnFXb3c1eWJ6MmpDekY3?=
 =?utf-8?B?ck8wNC9GRkI2UWhuVnJtbWhFYjdSa3JhT05FMG50Mjl4OGhQbFF2a0ZyUmVG?=
 =?utf-8?B?MUVaNDVBN243bzhmK2xKdGM2VUtJVGhaYnlkUmk4SkdISFRFOHZTejFaQWR5?=
 =?utf-8?B?NGVNelVTVURjRTlUMGNmdFg5STlYNk5qRVVLbVNTV3lLcnhzYVFJdGlDKzJ2?=
 =?utf-8?B?Z0ZYaWhldFBqRWwzSTBha0dtMkI3dkQrMXFYVzBLTDVRWE95eVE0VSs0M09R?=
 =?utf-8?B?enlDY2xHNGsvRkVQdXp3RGZkaUxYM1lxNWN0ZURUVi9TRlRsc0prck0yejhk?=
 =?utf-8?B?OWNicjZrbnpLN05NN0tGcS90RmVrcStLWGkwaFZjQkVSUlREb09SY1lOS2hY?=
 =?utf-8?B?ODRTdDZPOHBNQmNjbUUzV3JTZWlldkROME1rSmVXUVdzWkxRdS9YZGoxc05R?=
 =?utf-8?B?V3F6MHkrdWEyeTkzNHhJUHZmb0F3V2gvMHlxSjhXelV4ZjdUVnRIQkxqN1NZ?=
 =?utf-8?B?VEtkelh0bW5PTVcyRnpkcUtGWDgxZjV1ZUZDeWpUalRmcUJpU094YkdqWEsy?=
 =?utf-8?B?Rk1VN290a1F5M25MeHR5YW9waHNweDAvNUZUM05DZmxXWHRoZ1dnam9hc3Va?=
 =?utf-8?B?QXNJVW91UU5IdzNlWW11MVUvRmF5dWpHUWVpYmJHZmpsN0lDZDVjWVF6clJ1?=
 =?utf-8?B?NDVSOHBCOGl5MWE1L2hmT0krbUVDWnZPUVZ3cm1hZTh5ejBWM0llM1lOL0lQ?=
 =?utf-8?B?SHpiL3Bvazk4UTFPRzBtczNocGcwblhEMk1hYktxV3F2eTg1NTVQYlpVM3R6?=
 =?utf-8?B?QVBZZHJnb29CWGl4MFJaUXZTS04wcUd3bGZTanV0R0c4NHJ0OXV1ekRWN2NQ?=
 =?utf-8?B?Z3JDb3pYSkdYMXFvRTg5eUh6Zk9wS0ZWcVdaaDVGY05sVklhdzljcmozaDNa?=
 =?utf-8?B?SFBuYkR4U0ZwQlBlcFAvWUlOTVdGOHBNSk9WUFJ5NVRaRnJPWEdvQkhsSk50?=
 =?utf-8?B?ZGg0QmlTbkpIMHNNT1E2K2N0MTREWG9CRE92b0pNdjQrQTloWUx0Vlp4SERt?=
 =?utf-8?B?Ujc0cllFYTgzQmxzVDQraFhqSUFIcHZibDhpL2VUdUxiL2hHSlJBdnBoWUli?=
 =?utf-8?B?VDdoWFpzbFBPSmU1dVlQZ28rQ2dnZTAvbGxFK3daK2kwY0QzM1FIQ3l6d3BU?=
 =?utf-8?Q?AL+SQzAVNyhA4CJepC7QtNSGOkzoiWowzsAPI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekV1OEhKaWFoTE1BYnNkZTN1eWJkckM0U3FxblgvZW5EenI5cEZteXBnekxK?=
 =?utf-8?B?dkFrQ3NmNU5yZHFoVE53eDVJWHQ3ZWRNTVdRNEpvM0ZoeWd6Z3NnSGZteloy?=
 =?utf-8?B?eDJpUjIydGxhRm1pT25HUkZKa0dOVUJoVkJtaW0yUWo4c21MRk5PM2pDd01y?=
 =?utf-8?B?WjV4QkQ0cE5SdkhmeXY3TEQ4QlFXL3BFSE45WkpERWJGTktKQlAxZ2t3Qjd6?=
 =?utf-8?B?ZWl2WEo4RTd3RkZNY0tyUWVSb0tiajh3YnZkRWJiNEczSXp3c2t1MFBzaFNS?=
 =?utf-8?B?WDJrYzVXVGNkcGR1VjdDZGlBdXRTK0NrMnYrWlJjalJ0TUJrcTZXSldnaFZs?=
 =?utf-8?B?NDFrL2UvdVN6M0ZKQzVicGdhU1AwdmhjZU5KdGJ6Vkd6Q0FOaDdvNjhkOUI4?=
 =?utf-8?B?VUJtcjkrV29hK3R3allYbnlsc0JKbHM3NnVYSVRURlZMdmU2emVVQVdqWFNs?=
 =?utf-8?B?cG5BVEpBcFJoM3R0NWg3elQ0M2x3Zk5PVlRvc2VSZ2R5SVRKZUdIdXhZZHdD?=
 =?utf-8?B?YjhycjFNajZ6NHZyZTczMXZtU09xemR0SFplN2NwckxTV0M5WmhRUytSWnpx?=
 =?utf-8?B?S3JQcFF0WjIyMjlmV01vdCtEVEdTSmRldkNaMWRpaWpJTWcvQXRYWEVEdVpG?=
 =?utf-8?B?M2hHUVp2QnB6Y0UxUU8xRmQ4anRERjhRSjdsZUlFbnVvTm80SWZXVXNsR0Fr?=
 =?utf-8?B?dFVrY2l1T3ZCMjVudjNPMFoyVk8yamdMRG1LQnh5d2Mwc1JWcmQ2aCtlZkdB?=
 =?utf-8?B?YnRzM0g0TTh1dXEvS3d1N2N3eHF4Y1ZWOTlTMko4eEgwMWwzcFFFSHBOV1Bz?=
 =?utf-8?B?ank1bGM0TFdRSjFBTXY3bFdBU1lwQm1Td2xYdE1zbVptNE96Sko0MDJTZGlN?=
 =?utf-8?B?aEM2T0NsOXJMTHlsMDR5bWtiMnFWc0Vzem9EU3hkNlNQSDYvZXlxaUExTlR4?=
 =?utf-8?B?OFEzVk8rZGxWNVhRM29zbjFSc0RhMmJRYUZVNmdKbW9aQVJ5S0NmT1RTTXJY?=
 =?utf-8?B?aTViNE9tckVtdnNaNS9kUmtsVU9qNEVjN0piQWxxakIxNFhNODJVY1doMjJI?=
 =?utf-8?B?czJtLzlhVGo3Mk9Jd1BBVDZKZW1NOEtQYU5oYkZwUHhxbFlBanVBWDdDMnpj?=
 =?utf-8?B?SGZObmF1Wmc2a3JkNHg5czdOOVUxUnNCcVVvSGZybzMrakdhUlY5bjZXN2lV?=
 =?utf-8?B?WUNiV1UrK0V1blNwNEM1MlU5MVRYVW9rcDEzaFdScENnREMwUkdFdzFmb0FO?=
 =?utf-8?B?QWhWZVZvN0pYTThRTkEzMTF1bC9yd0ltTjZyV1hTZWFrT1N5M2MzbmdpVUVw?=
 =?utf-8?B?d2N3TU5OQytGd0NDQ3czbTZuaFI4WE50UTBaMHBnWjJtc0E4ZVVHVFV5YUNn?=
 =?utf-8?B?QXJFN2w4UVRGSUJxd3hyMFBqcngrcmVOVkFGNFlYeUVlakZLeTcyM0pQbWZJ?=
 =?utf-8?B?ZGZkTHFmQmljbHA1RDQrRFNuSGhBTnB3OC9GejNTYUEwQ3FIVkZLSVg3ckNH?=
 =?utf-8?B?NEQxOVI3Q2RKZWxPZEtEYzN2RUhEUnE5UjJwYkQvbDNEL3VsMFRYSGg3cUQ5?=
 =?utf-8?B?TFpkeko0VTdGMC9uS1JxcVBSZVc0WDFkeUx6T1k1NmFmMlVKL3VZU3l1WnJR?=
 =?utf-8?B?NllRaHVjbEpoYlVhYnFtb0YwYTdMMGR1ekViZjFLZExFOXNYeWlCVVZ5YXNP?=
 =?utf-8?B?bWpaWHZDYm9MZmloYjJwOW02MmV0amhsbS9jVHFDZmRnWGlKUmIwNE1QTXhI?=
 =?utf-8?Q?WnDtfjJzZmpX/oKj9D2pdncWPzj7rYd9ksV57Mg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa41a3d-3bc6-4e7e-e2a7-08dde2a35d6f
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 00:15:43.6838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF7433D3F05

Adding sophgo maillist.

Who can do help and have a look?


On 8/24/2025 4:08 AM, sodo wrote:
> *djdisodo* created an issue (sophgo/linux#3) 
> <https://github.com/sophgo/linux/issues/3>
> |[ 43.260734] spidev spi0.1: SPI transfer timed out [ 43.260768] 
> spi_master spi0: failed to transfer one message from queue [ 
> 43.260779] spi_master spi0: noqueue transfer failed |
>
> here's my dts
>
> pin configuration:
>
> |spi2_cfg: spi2-cfg { spi2-pins { pinmux = <PINMUX(PIN_SD1_CLK, 1)>, 
> /* SPI2_SCK */ <PINMUX(PIN_SD1_CMD, 1)>, /* SPI2_MOSI (SDO) */ 
> <PINMUX(PIN_SD1_D0, 1)>; /* SPI2_MISO (SDI) */ bias-pull-up; 
> drive-strength-microamp = <10800>; power-source = <3300>; }; 
> spi2-cs-pins { pinmux = <PINMUX(PIN_SD0_PWR_EN, 3)>, 
> <PINMUX(PIN_SPK_EN, 3)>; bias-pull-up; drive-strength-microamp = 
> <10800>; power-source = <3300>; }; }; |
>
> spidev configuration:
>
> |&spi2 { status = "okay"; pinctrl-0 = <&spi2_cfg>; pinctrl-names = 
> "default"; num-cs = <2>; cs-gpios = <&porta 14 GPIO_ACTIVE_LOW>, 
> <&porta 15 GPIO_ACTIVE_LOW>; //dmas = <&dmac 0>, <&dmac 1>; 
> //dma-names = "tx", "rx"; spidev0: spidev@0 { status = "okay"; 
> compatible = "rohm,dh2228fv"; reg = <0>; #address-cells = <1>; 
> #size-cells = <0>; spi-max-frequency = <400000000>; }; spidev1: 
> spidev@1 { status = "okay"; compatible = "rohm,dh2228fv"; reg = <1>; 
> #address-cells = <1>; #size-cells = <0>; spi-max-frequency = 
> <400000000>; }; }; |
>
> this has been reported by @timstableford 
> <https://github.com/timstableford> before
> https://community.milkv.io/t/spi2-multiple-cs-gpios/2042
> (although i'm unsure he was using upstream kernel source at this point)
>
> he links similar issue on rpi linux kernel which happens to use same 
> spi driver, suggesting to apply patch on the issue
> raspberrypi/linux#6159 <https://github.com/raspberrypi/linux/issues/6159>
>
> |curl 
> https://github.com/raspberrypi/linux/commit/12534b0b57ed1d78a1dd2ae47f4c111cfbf0a493.patch 
> | git am|
>
> after patching and building, i had no issue using two device with spi
>
> hope this patch gets merged upstream
>
> —
> Reply to this email directly, view it on GitHub 
> <https://github.com/sophgo/linux/issues/3>, or unsubscribe 
> <https://github.com/notifications/unsubscribe-auth/AAS4RBPGVJOD2OQ7Z3YJ2L33PDC3LAVCNFSM6AAAAACEUQXTT2VHI2DSMVQWIX3LMV43ASLTON2WKOZTGM2DQNZVGAZTOOI>.
> You are receiving this because you are subscribed to this 
> thread.Message ID: <sophgo/linux/issues/3@github.com>
>
