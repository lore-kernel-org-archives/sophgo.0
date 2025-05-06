Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4AE153BD9
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575366; cv=none; b=gTdDW6xF5XsFoYAuXUtzSyNuLbCco90+zKuy6xtlbwXlx4U/0lQmlPU2YIuVz0LkaUOtCKjVBMpgKT1e2RnIPscsjGs8h7wC92OuGUjLp8kX4J5+o42YeKFpn+Mt0Mp2ct+Z22ko6q4YmG1W5qefkpZNmXNH9CezL0OaJVLil8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575366; c=relaxed/simple;
	bh=bN6Xre6GbjWnrrHg6esYssYxyunEvPUSznLL1o7vQYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6SfmNsLj+SFZYF2kVK5r3NAG7DhvEPi8tUFjeqSpreKg+wKtBy5aJwkVPLoahkVitBjt6d85DjlCX/k+b27WcHwaScvxZPLv0+tJxsIKzpjl7xt2TdYdLyti25VGmP1cs6T3QOjKYesuzna6ZQy/j995jtR5q3b3DusO+MO7Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqjH/tW2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqjH/tW2"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7caeeef95d4so193808585a.2
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746575364; x=1747180164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLfEz//YxlWSQrp0pxzZLIDi5MwZhlRnzYF53iBHKBc=;
        b=RqjH/tW2z6RoZpbfNyN9W+tGSBL/8YYMKBV9Mk9sFyF5lFGuHuDxhuOTCSmECoHW/h
         Hg0SCXOQvLX3dWXmwpmNAV8TW5kJ5tl7OLkU5+eCfVgZWkSdR1IC4YbWgN9WicR7ilmB
         UXfCCuuBnQNEZqmnwx0QdJLFdWh+6z0cxh+fcNcrIrwGfP8oo/+OX65TUb3vmx8tcxML
         8lUcnqkOmIrssnokR617ADqwbzWt+VnT/tY/yQzH5WzhZeM0e0/GPnTraZixHD9G5c8t
         X2opV/wVRYq4Fa+bEARbNn4MS+xUHA9E+ADA833w5lFJwzZce4n2v2f5C0QOQCRTnRqN
         vyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746575364; x=1747180164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLfEz//YxlWSQrp0pxzZLIDi5MwZhlRnzYF53iBHKBc=;
        b=vXLxpR6tjISZkfIWvgsbFweqXUmDH7Ap3sT8HqqXfHdWDztW34ehqBkpb8gS5tAWub
         6R4ytSKW2gKDBhXVs/OvNAJndkXf4J9IFaA7KMIjywS4E6Fq5Ymvn+Gxuh+44TBKUhpg
         qBay8I274P+F0VJ7z+cEcb0p7ZI9ogfWscvLEnlYvTNpZWiOKRWxVLA+OF3DjxnmKu4L
         sNzsVi1MkvyE3uuxQHRrzlExI6qWnJ2dCS6JbrIoAtApHDB1ygQ/M1TwcXHze98yz0iO
         tchp2l7XZ4CUfZoiQqB2WI3nyLpjgjtvqZj9umTa+CFPhq6dT5/Dv9nsMBGWaFpnjegr
         5yBA==
X-Forwarded-Encrypted: i=1; AJvYcCXilZKdo+XugisjmcX+c1QDhcEg0QtNimxsg449QNoqwH4TNkn7FtI39HiDt9qzF53YiBHGdPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrirwZ3Y051Nw3cnB/pcZk+yuaYeYzjqk3V7alm5QvrE1gjcAm
	isImB9v4NGXdFKu0vPLBRgjFb2DAC29Z/CnKQ/7SHrBhIKdrHst5
X-Gm-Gg: ASbGnctr5fuN0ATBaceqMlQEmPi8QBqqgpHsuYFghHQWaSmnigyQC/cie0rtTOg0cfA
	uUHfWLdzsnwZWxAHFCSlXiq7Hp4OAbnrI2ZIT146thtrS1RaWP5EE2RoWrDlNCq79awblppcSLv
	zNBRey3jgnZajD/zcMVGMNQriEaszlDtHxyDSvKhssr9fUwReIG6QjUyzq331TJImef84MVZJ/x
	3oDA8OqgE6G42IxiQejgHnBYJeI/iqlyXURIxCeDG0h06F8PhURfdRXyUfE3NZjkx29QBWkTmQm
	9JfDFYCFjbin1wIA
X-Google-Smtp-Source: AGHT+IFNc9H3OqbhDKWVWD4by0j8urZWA+6ou0PeVS7Ar9B3flHhOj6AnypYnW3OvckJNbDCCZLsQg==
X-Received: by 2002:a05:620a:f12:b0:7c7:a5cd:5bd3 with SMTP id af79cd13be357-7caf73b1a87mr181273185a.28.1746575363534;
        Tue, 06 May 2025 16:49:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7caf752b635sm48956385a.43.2025.05.06.16.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 16:49:23 -0700 (PDT)
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
Date: Wed,  7 May 2025 07:48:58 +0800
Message-ID: <174657533290.212327.15123615268219732476.b4-ty@gmail.com>
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

Applied to soc-for-next, thanks!

[2/5] soc: sophgo: sg2044: Add support for SG2044 TOP syscon device
      https://github.com/sophgo/linux/commit/f18198c0de56ea636c74312bd09b9d67273412d8

Thanks,
Inochi

