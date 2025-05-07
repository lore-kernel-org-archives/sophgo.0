Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D08D7E1
	for <sophgo@lists.linux.dev>; Wed,  7 May 2025 00:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576103; cv=none; b=sYvOcwl2+3oA5o/xsyH7HQrECdRXWRaZgU09gCy8Je/XArksxHqn2lS/u4P+5ewozOX+kpMHiDGdsybCDEOmQsOKOmg46/chQIpqozquk+Y3lp7TeD2f7LKw+L69CEhH0MLviyNHzzjXtzWPaWkNDu0OpuQVBSmRhTpTA5sCzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576103; c=relaxed/simple;
	bh=gWqh/3eR0Rjlj8qYWl6zZx1DublCF+mdPydqJDW86MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uXBTXwjRILUCH9Dbws7DDbtpEa92ewcj8q2eJfp3R48LUyUKqKqlnnHo/Qiv2iEM7KIFcev3A0Qp9rZMz2defPvGfwip4KhCpuhYvUEKfrQ5p0lmmsnfFYcVahCB6DuauEYPOdgAxwl/yDd3QMShQDryrz9yuIyLG9D7n5CDewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1bgPVVP; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1bgPVVP"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477282401b3so70127571cf.1
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 17:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746576100; x=1747180900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50DIT5+hNwT/Ht34c4tLDN9hBXSig91HYoFKkiJZ53o=;
        b=P1bgPVVPWGWbZ+E2eZ0uyNTfwh9N2zAVJMxqvTLA9wwkGQ8kAjK0xo5KY67bRrXzUP
         w6vAu3tDU0NsfxlvRoLe7GNr9yS+UQ37pm6GqUponJr/8M0hgUvOObG+iEzTzttM86RR
         hHBc8N21iKwhwEZmJWcvPjmzsC2Hw68HB3gQ+krIutZLMagISlSCFsypCSOafDFpuc0V
         dBTFd2KpK4C6X1Zxc5zZ/0O+1pQ8/vrchx7NVv4toQNZdv7A3VUkKw2ZJLPrnGcLf5zf
         2/0MRHvSc2n3vQEO7H3URNqOnQ7XNtg4tSQaVn7AtNQ09bkPmIDKOL61XWr9NN948AfS
         cSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576100; x=1747180900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50DIT5+hNwT/Ht34c4tLDN9hBXSig91HYoFKkiJZ53o=;
        b=T9PxdDo8ZuO3qM4Ga62fBbKaNJOE4Cev2wSXF4/L4P6cqIKgXIAfQtgK00SDBNmZUA
         7bCeA47tgmAbtwPP2m5f7d3ptP2z/64uDyoP5FPKvoKcRITdBPTzJQHYz6j0wwOO4NtQ
         QGw8AF8NLuKs0q2VnXnk9fg8j3W4zG9lR7JpxkbHXiHSdKflzxTYu8OxZ7V5jVapF3+b
         tOd48DQ+iAm1tAwmOw0bKEzBASRhTYoMkF9rJhnwovtHQWkNNA7oVpOqj2eqLRkO/mdp
         Ya+3JkAgtvENWyyFqa9s7x3bSrtF0vkimljqGw5hd1MO/NZPJyp1mIdIO8xYN5hdVK3d
         m7rg==
X-Forwarded-Encrypted: i=1; AJvYcCUKtfutmhwXvffH0mzNV1s0XnyooFKfbU78J6kDE10o/xR1EmRGALmN4DbEQZJOJ30hcSzTOdU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ashWEQctedjiWEOYrsvrE7dcOhDCkIstS0Fs+g2TlZraBLAJ
	+4ZJ2s34bootM7MBNaP6UCXIoHuhT4fkoT8vSlMONqE7+0PEnW2j
X-Gm-Gg: ASbGncvx8vp2cj1WAV+YAVM7OFlZCimCjyTC1uQsR3Wg01InZA2UrxW9k1E0f6GWnuy
	/vH0a+wydAKeBGDlVrvAa7OOn8krC20IEhEAs8/gwjECfZHsEbLLRNxHDBvBukFmqEgy0hPz1+7
	9BnxPI+R/N/m2ljS6gvQ+QNtQ84ds/IlxFfNCBQmU/pcxzxc3VP6uebfYhLRGyyynvSXaOjSDlP
	U9UD4Dd2dWEq74ppDKGlKC3m0wLo5FlrX9XZCj19SMWvww0q38Pn8QduxQd6VlXznE9o2kd7UZq
	cJkujjeUNwFEG972
X-Google-Smtp-Source: AGHT+IF5dVIBqWmzWpTLbIydXWtnN76qIrVDzEiJt6opxAhjmE5bMg0jxsUxOxC5DB8owt6CtfkUJg==
X-Received: by 2002:ac8:5889:0:b0:477:1edc:2367 with SMTP id d75a77b69052e-4922795df0fmr21138941cf.37.1746576100154;
        Tue, 06 May 2025 17:01:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-49221843474sm4647191cf.48.2025.05.06.17.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:01:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v5 0/5] clk: sophgo: add SG2044 clock controller support
Date: Wed,  7 May 2025 08:01:11 +0800
Message-ID: <174657601728.224270.14258815179551738984.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418020325.421257-1-inochiama@gmail.com>
References: <20250418020325.421257-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 18 Apr 2025 10:03:19 +0800, Inochi Amaoto wrote:
> The clock controller of SG2044 provides multiple clocks for various
> IPs on the SoC, including PLL, mux, div and gates. As the PLL and
> div have obvious changed and do not fit the framework of SG2042,
> a new implement is provided to handle these.
> 
> Changed from v4:
> 1. patch 1,3: Applied Krzysztof's tag.
> 2. patch 1: fix header path in description.
> 3. patch 4: drop duplicated module alias.
> 4. patch 5: make sg2044_clk_desc_data const.
> 
> [...]

Applied to sophgo-clk-for-6.16-rc1, thanks!

[5/5] clk: sophgo: Add clock controller support for SG2044 SoC
      https://github.com/sophgo/linux/commit/41b08610dd262dc4a5e1eff993b2d21eab8b8ba3

Thanks,
Inochi

