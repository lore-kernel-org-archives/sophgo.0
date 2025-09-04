Received: from mail-io1-f98.google.com (mail-io1-f98.google.com [209.85.166.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B1342CAD
	for <sophgo@lists.linux.dev>; Thu,  4 Sep 2025 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010508; cv=none; b=jvl5nPY+KR/HH+58QnbkA53RPCDCa8j9T9VRFfSNs8axL40KBBr7y7lzkdX0Ij4nxk9iTcwqfoU2iw85Pr479sc6/TUXGAPwKXrxMEK/rR9LmiVScHntppaf6xQvlkcD2H/386ESDeBWwLy35Y5vG5HZb8U5Nkr7P72oZy0c1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010508; c=relaxed/simple;
	bh=FIGB+7RU64J1zqu7rqAxJlLVLxSkkOaRHMjXZLDhXT4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mNTzBr58W31j5sMLb9DLO3cXd+ziUW2zKtrUr70OeB+yQ+9QFEmaSLDrNKQyZqwyDEUGR/bCzLpEf0GaUJTohOqRVXEk75g+qCuA4YGIv5+hIsuPAkB/f5r3QorTmsEj2rkRbC/QL0EPxO8ybf0OkBy95bmtXJqFAs32TmItE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=e5rgPpFJ; arc=none smtp.client-ip=209.85.166.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="e5rgPpFJ"
Received: by mail-io1-f98.google.com with SMTP id ca18e2360f4ac-88432e31bdbso118586139f.2
        for <sophgo@lists.linux.dev>; Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010506; x=1757615306;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=;
        b=SRwy148BUh8Ua6lNZnR//F3KY+RXBrZT8zFI/uvX7SS3koClvslruGoDQL65qHqB75
         BLyRCi3sFd12UhwSWG9CpQLns/znYepEyAEXFH61HeyyuDNM7GaLq0j/CfT6Bb+YEu2m
         G/Ndmhv22hbOvC0uWoV120puCd7YAR8ViOolfRuOXMUF7G5YetoqZULNoKEDkTGDcLsn
         L2arXEjMbwYWeArcYW/gC1qEK1BBivKn4tq/Wn7YlZEKc6cqkUprSK7F30XS08LvIJwf
         9rhc1YNL7/3MDqYHheeF38inJyV0UTJTsTV5gZHDDWSeHmbPIoYfZx0gRFr16wWaQ78L
         cQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQyNjnFx7lYU6YxbV7iESLAsv1w/SOqp43Eu/v+yzSFkMbXQviYGD/mzPluwYmyhV4KYgL4+s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJHTLgqsGv2uRCDxxqUB3LDB3bb++kKTdOr0iEUpczWueKwh4y
	8NzltHnf3Iqwq2SPHGELJePRcDnxLUSifKmTil3SHi6k+0S2Sp1WhSozuOxrKLS4FIzdzxIXRjX
	ko9JXGWUCvDiyqTj/l05uABE5wXdQ04TdW0WQ3rlU9WqKGUxCpRQUcXWd9xg2Rg2xgOCYOngZoW
	+Arsw9L30Zp/6hsWp+7VJ+YtQ2yJURUsjj/3MN5a5Ksq4gO5+WIEgOkGimfXiwgYbHQ2Hd+i6c7
	ATjlB4pge2t4rxb
X-Gm-Gg: ASbGncvrjx8J0M3GcqapfY1KqcxI9B+PIZ5SwECHe2ILgWkoWCuQ6GpizYWyUqH9PVR
	s0+EYPupB7cDbc/485FVMdZkXYUKzbb4khT9VLE2EqEmVqfnj2xhBnjacwj3SFZqVi1WQJf6oDW
	Y7yrbA/OwLDlEjormDajFCmg6w+fC5fc3XYg+40DRh9CNswbfuuE6SHGxV5HnMHQZ1Nn8/DfPGW
	mhduFDwQNIwIudIXaXOV99BwvOri5a2lHy48dYmIOWoEkecXa2kXQmObACpDwLpYC3svYjrsTsM
	24lPSxF3xZzwpTcP6fhdmKAThLBNCVtEfWVpMNQce9F83vpqz5LN4aP0TaMkM0fOwiEHEU18U3q
	wN0WUbRC6tP6JEx57XGz0pK+fqo2DHuyD9bZ3YrWga6P7GDILSj9WPP0PwgLVicH1roSrukPvfG
	dv1jlZ
X-Google-Smtp-Source: AGHT+IEa+9oIMnAGIlQnl7bMVAuWb6eoOAeTyF/rkT166Hin+yySA/7+b5d9ZLYb4asLCHfxU7jD9f1BCCb2
X-Received: by 2002:a05:6602:6b0a:b0:887:33fa:1a8c with SMTP id ca18e2360f4ac-88733fa1d04mr2711455939f.6.1757010506052;
        Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-8871e3ed295sm83831039f.11.2025.09.04.11.28.25
        for <sophgo@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726a649957dso25584756d6.1
        for <sophgo@lists.linux.dev>; Thu, 04 Sep 2025 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757010505; x=1757615305; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=;
        b=e5rgPpFJDkApTMo+xSwZ4N6dlOqGh2CgB7OJI16hyvDUHdMoE8jEFApGs4MHHlWIcR
         1t4XrT3//wq6AbZCelbrcR5opaxe8+xS17BLKEZlR0nZmDY+ySqD2u0xeCY+SBVLAYwD
         QN2Ij9Ic3slpHNhaLg3m3/kc7WuM5Gj2jQuaw=
X-Forwarded-Encrypted: i=1; AJvYcCXHJ4R2d8duYVc6sklzXzISU3UKota3gQeVQneqFwHjDtgJSK+7de3j1YDA3MRxc8a3MOf6cuY=@lists.linux.dev
X-Received: by 2002:a05:6214:f2e:b0:721:ecaf:500c with SMTP id 6a1803df08f44-721ecaf6105mr113127036d6.52.1757010505042;
        Thu, 04 Sep 2025 11:28:25 -0700 (PDT)
X-Received: by 2002:a05:6214:f2e:b0:721:ecaf:500c with SMTP id 6a1803df08f44-721ecaf6105mr113126596d6.52.1757010504453;
        Thu, 04 Sep 2025 11:28:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faa7sm51543216d6.66.2025.09.04.11.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:21 -0700 (PDT)
Message-ID: <e1af06e4-4583-45a9-8404-34a01103e92d@broadcom.com>
Date: Thu, 4 Sep 2025 11:28:17 -0700
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH 4/8] clk: rp1: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrea della Porta
 <andrea.porta@suse.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
 <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
Content-Language: en-US
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/28/25 17:38, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Applied to drivers/next, thanks Brian!
-- 
Florian
