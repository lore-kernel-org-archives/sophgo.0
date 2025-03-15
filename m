Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D8CA52
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742000339; cv=fail; b=AfsALMw8ul2gK+v1kqOQGO8b8LMMNdWpNtFeL4kukgl0gJKBT8QPqE0UXKew5Fh7PjzBtyTgt7eBGiNwHf0BINT2r7/XY9lTayX7m+cbNHV8aYUwVvgWYMPZzYo/xgEUfn5g1ywNnfuMS3jdwKVQj4vpOpn+IxxjGX9VBJ86Hgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742000339; c=relaxed/simple;
	bh=0wZsh2ygHwCAAHVSlnnVhnmCY+smoLcOGcBTrYEMiRQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qwfcXk9YfFmKc1a5sKBMVVoA0+vzie6QOKys71wDyJDdR9QglpIpgBxVLDD9KHCrtsUGLYspUCohYs2EU7eLunstHW6wEyBcZIaaKVqK5LLwFP374TNO8Fwcljgmy8w9N2d6TSa5Ps9P1yU2nnpp7w4TpJxe3IHnskG1YYw+DZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uOL9arcF; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uOL9arcF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFU85N+3H3Zu56/ifkn8+xLlpLxPWYhX08GnhJYfg9wOqu9CdfsYxAbXVS+QKCok1qHdFw/4u0IgHkSsZi0afrGQpOxkhYBpxTxrHbq2cPE1xu3k5xmVhiy7SgHXxYCZoc6D00DlzSYfW+qNCDSoEZz8vynbFl07koFoxL/JljVlYLOSzJUUT1wm/ItJh8uWH+A9+QhvYRNxLGkCwndIjrKrdSGkVQo8hejrJEJgMQMkJF0HcdW+0uMVXL82iTkHsXngofNwCkE160Mkrz68mWoh8hRD45kxoqJ1cFC8wYu/VTPL3c0XPNkWYGJaXC8AWgkR9+r50nYv4quyd6eBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYF8V8FS4jI49ZRhzwXLjl2O1IIV+iHI+8vcZ6m5qwI=;
 b=XOkabEpGdEcCMmP4w5+rqZwA1R9Qq/6rYdhpZhQEz9bvYUkVTNI5wzwuYvj042D+5w/IcJ5y3Mg/i3BqU7zkETPoUYlvJZrOKHmOiQ0Pa6Ay4NnGLjrtFdu+D3hrSr/8rWaXNomZwK58Vf977d1q8c66wrRBK8U4RVgX05dp3hlg22YdjF/AT9xLPWc8GZNGTDhD9Os4Hu8fNN+jYQ1YqWNK+CaFwfUk9CDpxq3TDyJgdDB8MnOZHEK4dw52E1DTVGP/JewSc03dHbUKBFjS9OUkkXwud3/5CCmqki62ILXGru8JjHaUQv1X/9hgq5RG4rD1KRF9U5Yg/RfSfeUnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYF8V8FS4jI49ZRhzwXLjl2O1IIV+iHI+8vcZ6m5qwI=;
 b=uOL9arcFRFovUgVktNI01crfKHVmu/IaNBPyCEwQ7GvNlPVa4p7n/h3tZcbLCNV8E0E2Kh1Mdu1+4BsNmLUP2V122soKX+V2cpgUF8qTrOA3zPW+8sC7XPYqY2RBvo/dK85S6aZ75+vEi5b80850mZccmQNgV3T52+g0QKgeY5sRS8lWmyQsHR0QoHzVI4AsAmpXC86UGgWKSBN86UZwBePa5jbKGpF4QNE/qYZQpwto1bD6xzNEmn03BM0Sk/1myrDEU9s/832uf6rI7VURE+tgm+z7DGboTCjQsyEtEWUizzceLV81SnUIlHg9vt88Ve1ye5bOhoniVyllxUBzRw==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by MAZPR01MB8967.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Sat, 15 Mar
 2025 00:58:52 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8511.031; Sat, 15 Mar 2025
 00:58:52 +0000
Message-ID:
 <PN0PR01MB1039366CAC1E68F6EB5F4F81AFEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 15 Mar 2025 08:58:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@gmail.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <1d34e445-31e8-4d94-b5a1-c5dc496b1a52@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|MAZPR01MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c53be4a-59bc-43ef-0fe5-08dd635c8c3a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8022599003|7092599003|8060799006|5072599009|6090799003|15080799006|19110799003|12091999003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEpIeWZrWFpZYUJPN25Ka1pZWWdnbkt2ME8vN1hPZWtMWjVRUmJJdFA1VjZE?=
 =?utf-8?B?K2ZnQndPRG9ERmRZbGQxVmE0MmpkRThGd0J5cGNINERmb1IwZGh4MGRYbk0v?=
 =?utf-8?B?bHdHZG1XeHpheWhnY0JDZjNhejhhRUNIL09JSDRwM29DWHp4WHNtVHMwLzFu?=
 =?utf-8?B?bXB6b0hVZ21PeEJJS3gzck1VdGdoUjFMdWdqeFVPNWJvTjZXM2hIS3d5a3ll?=
 =?utf-8?B?eEx5bmxMNmtKSGgxeVF4eXlZc09lUkVaeCtQQlppNlVKcmxtbnUvRU5yekJC?=
 =?utf-8?B?akpoVnBLRW5LdFovYVJ3MlhTMy84cFgxNXlGbkpGUHZGUHdQdkdodXJGMk9j?=
 =?utf-8?B?b3loYmRyd3V0ckZ3UlhaZFR4WnlRcFp4K3MvVWM4VkdjRjFmdVdYVmZybjlO?=
 =?utf-8?B?bWFkcS8xTnUxRzJHNlI5WE1nNVRCWERhV1ZlYXNkdzBBZWU0TjJUdGNPZ0pO?=
 =?utf-8?B?bTdkK3pSWUFUTTR6MWVXcEt5aHA3N1RHNDJPQ2R3K0hRUGNZL3FteU54ZVNa?=
 =?utf-8?B?NFg4alE1bDFmZFZkS2RwY0l1SGxvYUNjR29PRWxsd3RzdS8vTU9OcHYvVHQv?=
 =?utf-8?B?ZkxqaVZ3ZkliTGJMU3ZvcStBaFdkb1FHNlBaNFhmVnNsUWd6cE1iejNFNG1X?=
 =?utf-8?B?Vk1IQjMyYnJURHE0VVhlNmNNS1YzZzZZQUdUdkN2bFJQOTJyeHBtSW4yQVFY?=
 =?utf-8?B?Q3ZiTE5QMEpVS1lFWS9SWWptNEJ5bHd5aHNSQTN4a292cmlvMUMwc21zK3JH?=
 =?utf-8?B?Y2NpWTlzMjEybmNZMDc5dDJsT3JMVW9aNHZwamhSQlFuWFZKMCtMb2QrYXZU?=
 =?utf-8?B?K0QvRjcrSDRYMFBHRjJudEYzRkZZMVpyMGROOFNRZXRVMFRvWlB2WkRlVUtG?=
 =?utf-8?B?YU5leG5jbmw5cytTNTJsMUlyK2daN0JPWGI3OTZSY3JWcGkxcmZVUFg3VEFK?=
 =?utf-8?B?Tm40RjJ3YmhGZlE3TXAyZ1M4c21NWUVNUlNsNGJ5U0lGV25GMHlYMFZGZy9D?=
 =?utf-8?B?ZlB2V05GREowQXMxMnpDRkZpY1NOcUFpOHN5RXRrdERRSEZkUEdLbFR1OVdE?=
 =?utf-8?B?bXh3UUdOVzZQSmlCb2tSK0hUUENqeFpGYUJoUkRNOUwvV0FiU0lRODRxb3pu?=
 =?utf-8?B?eXRqbmQ0Q0t3WHZyRkZiTlpWTEJQUEI4bmdHOEF5WnBxQlBaSzBCREVyL3pa?=
 =?utf-8?B?T2RIMVdxc0Jub0V0OVB1Q2NLV3FpSEFIRXpZTzVHbGRpUFlRTHlBbDZKU2lI?=
 =?utf-8?B?RU1taWhzMEtKTEJuQ29ycmlabkdlK3FIem5UVGZoc29vWitTaWI0VU5NV01M?=
 =?utf-8?B?cGdTdlBCV0VUTVJqZ1FsN1JwQ0h3TFRrQko5NlFmQXZmWWlyRzNWS2RSZXNB?=
 =?utf-8?B?aDdIQmo4N3NzOGd1R1FUQVVyRkdDWCsyRXhSSzVJaHpPS1pWamtmM1loN0Fo?=
 =?utf-8?B?eVk5VXlVT1ZBNCtJWGc4eTJIbklYKytFbHZHUVMzOTc2Ujh3eWROMldwUGhp?=
 =?utf-8?B?MUlkTXd6Zk5iR1ZpVVIwaE5DNkxncU1lVUFwdmtQMXhqQldZSXpLOTRsOS9G?=
 =?utf-8?Q?Z2o69dFKRFVAFoIGiIpxrFlzU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXBwclVlSnc1empXWU5nNUU2SWxFem1hMzZBTmphUDk0bjBwQ0dNcUpnZDBC?=
 =?utf-8?B?Ui81azB1S1E2aHY1ajdHYmtQcmpEZW9naDFyQ0JUV2xhRDVnY3I1OFFFV21D?=
 =?utf-8?B?a2FYc1h0Umtnb0Z3Zm5Hb2VHbndCK01JQm9jUHV6WjVuckhzaS9SRW1tbStV?=
 =?utf-8?B?MDZKYjFONGd4bDdZZDZVZmI5NndERG52R05IYk9ZbjVhUlc0VlVZZno1cjVz?=
 =?utf-8?B?ajFETzZDWnlRZWlpNHQrNjJJT3dFTlo3bVp1cGVpeFVzMjl4cVNlNmlLb3pv?=
 =?utf-8?B?MWJxTHNub0gvZFBHclNPWi9saURHRmRFR293aWhHcXRoSXFtZnNQUnZDMENs?=
 =?utf-8?B?cjVMS3ZGbVU3ZXY3aWRIOGlOQldTM2dJUVBEdjRiYWhrdDU3dlozVXV3UUtE?=
 =?utf-8?B?eHl3d0lNa2wwYSs1Nks2UVYwTVppbDk1SE5DQmpwMFAzZ3pyUFdqZU5WdFRh?=
 =?utf-8?B?UGJZUE5ESnFUZ2xXVWxLbDRRaFd2SVdhOGlBL1F0Vys5ZjNOT1IwdHNtaFBW?=
 =?utf-8?B?U3h1M0tjZCtCSG1vY1VHcjJMSGEyRHk1Qm9aNi9rZ01FbmNESERWdkZOQkd5?=
 =?utf-8?B?Zzh1clJEUGtWYWxRS2JLemlLYWJJbnBYSFl6RXlHTWFtNlFNb0ZybzRLN2ZT?=
 =?utf-8?B?Rm5mM0h6YTJNS3VtcWwxNVN3N0Nvb1RJNERXRmNHS0ZsSklTK25GRVRycUc1?=
 =?utf-8?B?Tm03VmgwUFRLTXBZNGxVTmowRklDRkY3OENoMDh6QWFoVUIrUkV6VldqNlhr?=
 =?utf-8?B?M1JhZjdidVlkVTlkZzVYaTl0bEM3K1NTT3V3ZVNkRXZKM3RiMlF0ZEx5TWpI?=
 =?utf-8?B?RmVMc2kySlpHcjFOcHNFeUdEU0hRMjF2R3ZWSE8rTXEvQmQ2N2NiR3l2Rytj?=
 =?utf-8?B?Y2xaOEtHczNCcnk1YmJMcFg0OVh1YzlKbk1JaEYwN1ZRTThzTFhuWlNZV05q?=
 =?utf-8?B?VVFzNzlLbmk0UkVHZUJxdS9hNkNBZ2VEMGgvWmNwY0VlZTJmUUs5aVI3RHVO?=
 =?utf-8?B?NWkzVlE2WE13dmFEQzlZYUN0NVFKcWpQS3FkbEpMaXI2Mm5TMUdjdnhJQ0pO?=
 =?utf-8?B?WFdvYnYxZ0locUlubW9RZXJ6amtQWXdEdWNCVmtYQWYxYWJQZHdhN0R3bTB0?=
 =?utf-8?B?YU1GczE3TENYaGhieldXa3pQZ3c5OEtwYTBiSmhTRjU0Q0lmV1Y1c2pKV3Zi?=
 =?utf-8?B?MVVmYlQwSzhZK0ZBcWp4NGlLVTlXKzAvZUVJOWwrbDRRdGxZSU1oZXRFSkZ0?=
 =?utf-8?B?ajdhQTR1YWxCWkpYeis1c1FsSGRmVXU5MklFYTlnMnZ4UFpQQUI0RkcvWmxQ?=
 =?utf-8?B?ZEtLbCtIbUV4aXFOekgvd05kb1BTdElld25CY2dsVlZERFJZMXEwMGxCd2J5?=
 =?utf-8?B?bXV4WFV1b09vKzg2bXdXSEpSRzdaRytteW5yWVJPQzJJNEIvTUo3YlIyVkdT?=
 =?utf-8?B?QmJaYzNrN2RXZXY2VXhsUWpmMkRmNklzR3FDc0ZOdWUwUVJ1TDA2eld3Vkxu?=
 =?utf-8?B?SHJXM3FBU0JMNXpiSVpybzh3NGpzYm5lNVBUMTZaZUFOL2RvNFdQTVVvb2pZ?=
 =?utf-8?B?QTduMmhDWGtaSTlYdjQxdDZrbitsRTJxaUxSZUlDS0N3VHRNZnhFTDlTOWVk?=
 =?utf-8?B?ZzJ3Qkd6RkNMSkFjMWYwUkQ1cEhaZVE0a1d6QUlrZStYa2NkbUNybCthWTdJ?=
 =?utf-8?B?WE1nbmNzaWFBVFM2eFNNYkxWMXU4Ujd5bUUvZFRKZktaKzArSG5ZTEV6bjJI?=
 =?utf-8?Q?qL+f1k58Cqo/QRurhQfbRN3ZEXxSlTZSAiBiTzb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c53be4a-59bc-43ef-0fe5-08dd635c8c3a
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 00:58:51.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8967


On 2025/3/15 6:05, Arnd Bergmann wrote:
> On Tue, Mar 11, 2025, at 08:15, Chen Wang wrote:
>> Hey Arnd,
>>
>> Please pull dt changes for RISC-V/Sophgo.
>>
>> Please note that in the commits I submitted, I merged a branch ib-sophgo
>> from Linus Walleij (see [1]).  because pinctrl's dts patch depends on it.
>>
>> So among total 13 commits, the following 5 patches are the actual
>> patches to be submitted in this PR, others are merged from the branch
>> ib-sophgo.
>>
>> 5277657d5383 riscv: dts: sophgo: sg2042: add pinctrl support
>> f047a9285f9f riscv: sophgo: dts: add cooling maps for Milk-V Pioneer
>> 62cdf0a06dd5 riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
>> 8630ed6f2adc MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS
>> 255f83ba5c16 riscv: sophgo: dts: add pwm controller for SG2042 SoC
>>
>> I'm not sure if this is ok for you, any questions, please feel free let
>> me know.
> Sorry, I can't take it this way in the soc/dt branch, since I want
> to have only devicetree changes in that.
>
> Normally there should not be any dependencies because you
> the device tree is meant to remain compatible, so anything
> that worked before the changes should keep working after
> them.
>
> Are you actually doing incompatible changes here, or is this
> just about the DT binding?
>
>>    Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml |
>> 129 +++++++++++
>>    MAINTAINERS |   4 +-
>>    arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts                  |
>> 108 +++++++++
>>    arch/riscv/boot/dts/sophgo/sg2042.dtsi                               |
>> 15 ++
>>    drivers/pinctrl/sophgo/Kconfig                                       |
>> 46 +++-
>>    drivers/pinctrl/sophgo/Makefile |   8 +-
>>    drivers/pinctrl/sophgo/pinctrl-cv1800b.c                             |
>> 27 ++-
>>    drivers/pinctrl/sophgo/pinctrl-cv1812h.c                             |
>> 27 ++-
>>    drivers/pinctrl/sophgo/pinctrl-cv18xx.c                              |
>> 602 ++++++++++++--------------------------------------
> You have overly long lines here, probably from copy-pasting the pull
> request from a shell in a wider window. To fix this part, you can pipe
> the output of 'git request-pull' into another command, e.g. 'xclip'
> or simply 'cat'.
>
>        Arnd

OK, I will fix the issues and submit again next week, hoping won't miss 
your submission window to upstream.

Thanks,

Chen


