Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010002.outbound.protection.outlook.com [52.103.67.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC026561E
	for <sophgo@lists.linux.dev>; Wed, 21 Jan 2026 00:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768956400; cv=fail; b=COjPHa1Qx1wdGunTPy5anI+jdZqIyTYE5J71je6nMZwUtX+eTu/CyNY5vot1a+whtXSBSPJIdM5HBWOzXUcOv0lJliVUJzuKaM6AMWghB6fx9KWWnl/imvwyVcn41zmrD52hsuJWi3tD377Ur+hbK0PARkNEPH2Fiu7BPXTPKfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768956400; c=relaxed/simple;
	bh=q/fhMqmpJb8CtVOm25DS7ETHTV40SOzHzGq06Aqe1+k=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=kSX6HTrdHfM1OHL0l9PC3nVLa/irp/GMXv4K7w+rFQu4J/NSFoGQ9Gpd58w8HQTT7aQeQXM7kBHKsabukYUNayY4tw0Ju0Dcqqp10KddGP/sydvgHlunlrXnVlxtKtFyFcpcX8yQzDocbwM/3fgpjwnd25CSAZWmn9XgUK4rVQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=XTQpVTlr; arc=fail smtp.client-ip=52.103.67.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="XTQpVTlr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9FLJV3SD5gC+2dlfHPSwwHg+qFFhPvmqFabW9BuZYVvQqdKIjJNAdsjwOKL+pCXiF8LwGlN92kAnngdffmaQkv9b7GXxr2tqqt+VfO7mR+Ve6RrgyC0FmCllthkYcG7GXYXbER0fZuGfQWG4GbUVO19rz2hCz4PxVk0Aox87XBkBLKAx5PRx4aenTNwDkd56hMNZuSES0SyzfS8KEAkeP+E8WDmFA6ifzIwfSidscx+GPvgku58PrmTPVvw1eQlv+IX2Eo33hjJio/NpmI0mWilyFzC1O+YgwYYn2IsL2Lo+ExvuLP0u7LMfCUnYoGbhoJUrrydruP6duC0H0TLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIcdaruLgUoufLO6N6SWfbbOe2mDU21xzd9VLNiQj4E=;
 b=iRUbV2ffCR4MWmonrLYmGabSDqraeVemAihhN19TtwyPImKWjP1v3ehUl6WbUIGRqWMPkJyie3JZgFw56IqK93z5d3FE9oH9ZbS5CVtLiz3/iixMyYUSQtFVrBQ8qA90Kep+o3F1S3MLjXYlspjHgztRDM81IFCWDvxEL/ZStD0y4a0UWSmD0K/ES7GZXcWyH4An+uv4fzf7KxvTPLd1mi5XaAkW3FJXPNgsKP8mnCTZwT2f8JfqEDJtbLRS/UbqXD79yD0201ARzNabiqiNu1rz5t/pCIPXn0hE1fZqEB5YNg8yXFSNj0ZWwZXsrp+9kmSQAL4l3AfNmmnjen8XyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIcdaruLgUoufLO6N6SWfbbOe2mDU21xzd9VLNiQj4E=;
 b=XTQpVTlrdwsNfhb/OcspnV+SShH5dMOhh0HCg8GEeav2NQ5md5h2uhFnUQdfBZn/z1ethPOEGx4pRINK0MPxUWtaRHJeXxob6d3bcG9j4mpl36BtDfQHbU/z19/4CubmuEGFq/q/jOakJ63RdE0pStzPSj/8MS0Grj7ELn/xDUDqoLyfZps5MqjvemlmeOkM5kzheAp3o88B88qg7lr43yI6DmIYatqOJo3r/Mjgn/i1J0Zs9T+vDxXdqSnPZ8fA1gnD7qn89MMOLPXwxUpcHSbDs8NU3WdhDxpB3+kmaK/yP6F5t9+xtgGHOsFkOo2CaSkV2c7pvDBZnO9QXJDQ2w==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA5PR01MB11315.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:195::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 00:46:31 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 00:46:31 +0000
Message-ID:
 <MA5PR01MB12500D99CB14A37FBA543DD36FE96A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 21 Jan 2026 08:46:27 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 Chen Wang <unicorn_wang@outlook.com>, guodong@riscstar.com,
 Michael Orlitzky <michael@orlitzky.com>,
 Anton Stavinsky <stavinsky@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <8311c878-d851-4f7f-bb55-f162dd01dba6@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA5PR01MB11315:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad2574a-f691-4486-9349-08de58868476
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/FkC6f3CzUg58oa+b32a85HxlLliwyiPzvShEHGWMB69xq1+YzmMB1vwfmNIo7BthqwLFAhaEESz3+JvE5uO7nwvz4W1E5GG3ZdpApuQi34FFGknf5uXl0y27uLH+9pU9p7Nq1z/3+rm8JWstZw0XZn0h9Umu251AdDqFhmt2377SPOX6mJ959DzGJEuTvExr5/Hz3kwugA5stGrDUL1IVx+FLdnrVrj+/VQkPWK89A52MDWXbQU7SUFTFaHDrk8Jp0RicJaDNImFi3M0kP7/jEEYaxkhVSzdbAG7KzxhAysgiRW1QXgO0nXQYz/2aELqiXTpRDTYRu3JmvI3B5wDz9K3Npd70tk+NzjWwhsi/IR8WrfPuRj+iNseIfcouV+dKf3nOMTu+NErZwe14nAnqgurFd10INnZW50i72LO2cUshVDPZegVqswSQAqZbUEZVOqYHwpUI++KGmtAFU74/gDsMXzdjF8N1g19vPrvywpBoQB7jyicx2pK6EIvjVFITPU8eXPkNJ8O44dLV28pWrS8c6bjz/RkpfvpVcc3C/FxsullU2H4K3Y9jB6LfL3CJ5xYXANOtzO5yj1idggzGD9848kkT4DBLZ9uXDbmv57pCfLUQKvXVokJ43FK558hFg8i2n/xmixvZTZS9yOXWPpIaeQta6b7DvzTYVqQt+FG1Fb05k8YHNjuJrpujyWN2z1DhGl3e+GaO6fpvLJNdLEyDImSD0HM+vJJ6mm2DIbFakkX/zWqhg/jp4thTRtZJvqhv3wNk7Y=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5062599005|51005399006|5072599009|19110799012|12121999013|8060799015|23021999003|15080799012|41001999006|461199028|3412199025|10035399007|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVNQTmlVVXJsM05ZZEV6elY1Q05yODV1ZzAxeVU5bjJtUTZlT3NhSGxvQ0pr?=
 =?utf-8?B?OVJKd1FmL2xBU25FbHN1dTdvVEdIbHJlU1RHeUFIOUp2SC95cWlMemZhNUMy?=
 =?utf-8?B?NVAzWG11S0Y0MHJlOEc2R0hobXdxUlplbWNhN25GZU1JTm51SS92Sy9IWm9O?=
 =?utf-8?B?Uy9QeVBMbHNVRWw3OTg4RXF6UkpUcDg2MDBVMDFWbjB1Z3BmR0k4YkV4MGlx?=
 =?utf-8?B?NTg1MlhJQ3FhUEFRUzRET1RaL2MvaHhvcEU5VGJKVGR1Y1F4QlUwS2JRVUR6?=
 =?utf-8?B?M3VrTC9hcFloSGhNSzdpYWZ2c3FBS2JLY0dNMUFhTjlQV2JOR3JybkFuaGZu?=
 =?utf-8?B?NE8rUGhublUzV0VpYlJCeFlJSHhwSno0ZmF1TXkxY0NYdHVlTHpqNlNxV21a?=
 =?utf-8?B?a29ibVMzUVVINVhCeVFuOVgzN3lQUEtKYUdZa0lVUnU1a0dRVWptV3BvYjNZ?=
 =?utf-8?B?SlE0cjUzeUhlK3NDL1E4eEJSQzJvcDh0TC9pa1hzaHBFM1pOZWRvK05wRC93?=
 =?utf-8?B?elBJQWRyWXNJY2NmMk5FbnAweXd4RUZlaXdqb0pIWWx0dE51amt6TTR4Wm13?=
 =?utf-8?B?ZFhLOWFkYzFyNnlyVlk2OVVVUUZBanJNY0RNamoySkRiOHo0MXBCVXFhbG9J?=
 =?utf-8?B?c0dWWm5odGUzM2VHVTlJYUEzOW9OMGRBSmpiNkN5V01hOEFaaWxtRFhYOWd6?=
 =?utf-8?B?Q1ROcGVuTU9KV3VuV0dUSEEyS29HWFRqOWhIN2xWazRRV0xZa25lQVg0bnox?=
 =?utf-8?B?dnc2Ni9PV053dHRjamdndkF3MFV3dTBaaXRsR005NTV6cktsTm9qZXJVOXh3?=
 =?utf-8?B?T3VpUDFRTE5qVThtbkFkdURiMXVieUNWelFpNlJTUHRnK0k0V2VLWndpODV0?=
 =?utf-8?B?dXg4ZGEybUFJY3d5TUYxM1RnR2FRNlZzRlA2Z0E0d1k2eWxEVUZXM2dHS1Bw?=
 =?utf-8?B?QWduQXl0VUU2L29taFBZZEhGcHRXTEpzNVpjN3VWRHcyRC9JYkFZRWNVYyt6?=
 =?utf-8?B?TmZVdGtoeHNId3RGby9GQzl6TzgxQmdUL2hNbHB5b1ZiU2VudVA2ZHhhZy9E?=
 =?utf-8?B?dUljK05mYkVRUHZRZTF4bGN3b2Z1aURPaGFQWmdITldwL0R5L0dXQ2NkV3Ey?=
 =?utf-8?B?V3QrSU40R0VnZXM3dlJtbThUbEltQmxEdTJXVWl0ZldUWHNPYXlDZ1lCZVpP?=
 =?utf-8?B?YkdFNGV6VzNQeGZYZ3NaRmtTSVVRczNLRDlQSGo0SEtaNlB6OWRwTERlbU91?=
 =?utf-8?B?eFQ2QURCdS81VGRVaVNMMGVKazN3Ujlkd2VJMGduYkt2VlZrbXROTVNyYVFv?=
 =?utf-8?B?eGthQTRBb2tNRXRscnk4N3dGL2VHMnpyemdUY2xpVmNoNzVFU0ZJQ2tDbHlZ?=
 =?utf-8?B?TExrQnEwZlR4WWs3NzNQOFMzT1RDc3N2cmlhdEoyRlordXArd3JKcHhWZTB0?=
 =?utf-8?B?Z2lrQjUrZE5xNkVtK0pDN2RoU2hBWC9jbFlDdk5Mb1BJYjlJMEpmTEpPZi9z?=
 =?utf-8?B?TjlJN05OYkluRUw0aSs0QzdXYlR0NEdTSENySEpITkJTTENxeU1NVlEwRS9K?=
 =?utf-8?B?WnNZdno0ZUtTVXVxaml1b2owYlJCWEVnU21MS2ZtMERhUVJLenBhclA0VHYv?=
 =?utf-8?B?aTViVHQvemwwL0g0UnV2dFREdzJSWnNxSmV0NnBBRjJHNDlqYlY2R3FkSTNF?=
 =?utf-8?B?UFNWNEdWWkVFWFo3U3NPcUVyU2d3VWo5Nml0d05EQlVmYjNWRi91Qm5wM085?=
 =?utf-8?B?TWZETE8wbDIyVUFpSEl1SHhxb1dZODBqUHl5MWpqeHlaOGFwS1Y2Z0RxbWJv?=
 =?utf-8?B?VnFkY0U1S0hiWXdUeGdUdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1NBUU1PQWZjWVl2eUc5bUh2aDh6OUY2NHJLTklqZG9LZGNyNkoyMTRtTERT?=
 =?utf-8?B?QzhIQ29EU0xGVC9jemh5RVAwb3RyTERadTZJcXJsV3BLc3k0dFVabk1sd2Rk?=
 =?utf-8?B?dkxNMTBERUR0SnV6NWZlbVFSSXF5eUVyVmdJWDJIcVl2WlkvbUUwcVkzTThh?=
 =?utf-8?B?Q3kzbnRWNDNaM0RvZE1rSlBFb3gzRU10YURyR2VKRHpsbEVuU1JCZHJwZlpn?=
 =?utf-8?B?TmE5SDFzTkFIaUpNUXNiazVJV0EzZ3IxZXBreWt2NFZNcDV2bjZmQzBndWd4?=
 =?utf-8?B?dlNXVjdrbnJTa3I2SlVLWXZ4Q3hYOUJZbmhjWXR1VFhVZ2tsdnFXNURMS3dw?=
 =?utf-8?B?RWhQSnVQeUUrbk5HOVZWSjVLSWNNRnNraVZGLytpV2Z0azc2cDhXd29FaWJC?=
 =?utf-8?B?SW00b045elFhSWFRYzFLQXE3NTY3TXNDZFpQMzVOeFhtcjN3aEdEVTJMSHFG?=
 =?utf-8?B?M2VJcE5TR1pzOG1XWmQ5TUgzZnFXSkhtbmtVWStHa3JqTVh0MWZScUZYY1ZY?=
 =?utf-8?B?Qkw3alR6cVZWSEkyT3k3am1ObExuRmpkbGo0SXh1ZHpFcHdPbnEzY2E2R2NK?=
 =?utf-8?B?dFpsQ0RiakErMEI1bUFaWkpoOXd2UE9UYUwzQzRUVnhRTlpRQzdNUjY0Rk5Z?=
 =?utf-8?B?KzVvSHZsSU5QRXZQVnkxMURadldZUkUxRlFqQ0l3Nzd2bG81Snh2VncvQTVw?=
 =?utf-8?B?ZllvdXdjcWZKdlNWc3B2eFZnN3NEalg2S2JITWRkaEM0Nmp1dk4vUEZydE43?=
 =?utf-8?B?cmxGRUNvc2ZCcTFHZEhJZWErVnNKUWNSTGJjVGhrVjhaVVZ2TWRrMzZnR2d4?=
 =?utf-8?B?L1I3bFRBZE5mSm5WZWI4Slp6eHFHbTcrU3daTER0T1NBeWlLTUZUT1pwL1Zy?=
 =?utf-8?B?cnl4aEtTaTZ6dUxWY2I4dVhwNVJidldOYnoydW1pM1dzMHJMOGdjS2syRk05?=
 =?utf-8?B?RnkxaWdNQnFlSjc1RlNLTVZIdnhsU0hWTmxzYnNOaTZBVlcvSnZxTGQ1SVJN?=
 =?utf-8?B?R1p1bkVNREVjd2dpcEZaUDBFY21NQ2pKbXFRVE5JYVhWNTBmMjBvSU9xQVNy?=
 =?utf-8?B?TTloNEthRWxIa1hyTUcwTE5OSEVFVkJSbkZkU3Q3OS9ZclRaT2g5MWtZUE9k?=
 =?utf-8?B?SlFnTkRvd1ROK2hLQzlBdEtHbUM2NWR4T0V5ajhWZGlIT2NVZWVtSnRCUWpt?=
 =?utf-8?B?Znl3djFKbDRqejlNcmVVNUpLRmFjblJFZVlzMXlMSlhmd044d3VFcm5PODQw?=
 =?utf-8?B?MHFBWSt4QmlZM1E5QlZIOEwxWkJVbTQ3QTN2NmJEb2QySlNoaHEvRXZ0MitW?=
 =?utf-8?B?MXhhaVJlM2ROOUJCQVB3NGF3WWRvanEwMTVrMWpXMk1TQmhKQzZZMW4zQ1Jw?=
 =?utf-8?B?NnY1YW9KQ2RCTVM3QnlKVGJpU3FBbW5qSG1qd1UzMnBDZVA4WExMQ3hzNXRC?=
 =?utf-8?B?aUZDWnNTZHV1dVo4L0pUZzk4NlhFM3MvS1owZUtuOHovQ0dvc2pCL3FFYW1D?=
 =?utf-8?B?eXdRSmw2OEUwRGVacENHM0t2eEVoc0F3cHpPRjZvNjZFOUE0dnpSTTVlZVBM?=
 =?utf-8?B?eTQ4K2x5am5KMGxhSkZDc3pBak9wd0pJbEdId1hnZnJ0QWtzdlRHcWRHQ0ha?=
 =?utf-8?B?REdLYmFQSTMzdjlDZks0V3VJL0QxbEZxWTJENDUwOFZHQ25CKytwVHlGNWhM?=
 =?utf-8?B?RlJJeU9SQXoydmdod1NSUFdCNHBVaVE2QkxCOHowV04rdkcxUVl3S1F4Vk1B?=
 =?utf-8?B?bThTa0xyenpnLzRpcTFLR0RwRGU1RW9OYTFuNjNLdWtudEVDdU8ydkZ3cEtH?=
 =?utf-8?B?SHNMZ1dNREk4VERzK1FsMUV0ajRzcUdid0VMTWFiUUt2RWtRVlBjRnVLV0NG?=
 =?utf-8?B?akRMMlA2N01zRi9SU1lNaDFkek5mVW1QS1JLK0d5WVBoRFlEUFJiOFNkdVBW?=
 =?utf-8?Q?zCarJ2ovdL78vSRGhzX5imb99HJ/ONmX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad2574a-f691-4486-9349-08de58868476
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 00:46:31.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5PR01MB11315

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.20

for you to fetch changes up to f16ae81b80ca4e721f4c4ed1f28390115f7721eb:

   riscv: dts: sophgo: sg2044: Add "b" ISA extension (2026-01-20 
09:03:37 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.20

Sophgo:

For CV18xx serials:
Update RX/TX FIFO size to fix the USB transfer issue.

For SG2042:
Optimize the DTS file format, including moving PLIC/CLINT
nodes into cpu dtsi and sorting peripheral nodes by address.
In addition, we also enable RTC for Pioneerbox.

For SG2044:
Add "b" ISA extension to fix dtbs_check warnings.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Anton D. Stavinskii (1):
       riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes

Guodong Xu (1):
       riscv: dts: sophgo: sg2044: Add "b" ISA extension

Inochi Amaoto (2):
       riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
       riscv: dts: sophgo: fix the node order of SG2042 peripheral

Michael Orlitzky (1):
       riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer

  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |   4 +-
  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        | 305 +++++++++++++
  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  21 +
  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 479 
++++-----------------
  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 256 +++++------
  5 files changed, 544 insertions(+), 521 deletions(-)

