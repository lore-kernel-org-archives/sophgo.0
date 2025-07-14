Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0C7262D
	for <sophgo@lists.linux.dev>; Mon, 14 Jul 2025 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752453896; cv=none; b=DoKxUb0nZWNOx5kDw8iLWxx6XiQwMMKg0J43tkFBBB1ASkaak5ShaJ2WpPg3nr7NXKkvXoFrJIua17BjkmGT0E2U6FnV+TU+d8wO4GneZEl8VC7vs5R5IaqvsFdYIDBg1k9nTzVyF+t2YVf5IGB+4KAs9Otu6zzix18xEIXIqM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752453896; c=relaxed/simple;
	bh=aOgYGuJVDNzVBvVwPqsqAaluryen7EunH9oddumL+ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPkRLb8YdlQlq0huJ9C8samBakIjqiitXwca8q30rqcOpVG/WBaynCcD8lK3VG/cCnENz14auDC3fNQKYQfQhX+yFZ6uqPac9lCtmaY9UGZh68LBfeUFT33DbiLz8G+DeQjnzKkyGTrL8wfj9LhqHN3K/FRK96Tj2SjX+lBG64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYdMSG6E; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYdMSG6E"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748feca4a61so2103515b3a.3
        for <sophgo@lists.linux.dev>; Sun, 13 Jul 2025 17:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752453895; x=1753058695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLeYUFYsbjTuUrfuMR1HqB0mRDFpmVI0gLEVlp8hfmk=;
        b=GYdMSG6EmC9mlXAX3/Je0WuftNHyab+MyNEmLD9P+TRP6CxuQM+l2cOH8ZlYFbzMMg
         SvvJPMh7Io3hvsoGWvVrAS7xo7nAGsF/V63dtPbwT8l9ecKTx4BV4ugIgw4itjfhRh0z
         U7a5u69omrI0ZH/Z6rgdYZDwhPoSWkjwnjYDTP9tZ3iB+C9xWOfS+CcS83KDf5qqdMkX
         BR4Ej752IKzbmkfmcvAz2E2oZAsTLk/+20o+RauQTHXVOZb0Bp/ltlWM8p7SN9SuN0rv
         yQueaDjtLD/Kwqwokf3H2iQdJ9zqzCNoSiGoENjsOCHaqS7tyVzr9gCQa9GuPxiMz6G1
         Hrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752453895; x=1753058695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLeYUFYsbjTuUrfuMR1HqB0mRDFpmVI0gLEVlp8hfmk=;
        b=DqsL7iI+4P4QvLbxhp5DDQAud5aaj8tjrfCpXYVOCtrxzqfvldLQQgqxjQFogCGvac
         Cfb7MeX5zGU1OKzs6Jt7UFSbH1QWNXR9PVi1gCqysTZSxg8ech2GvGXTxcZXtzBf3pIT
         YsB3BPumqnHhC9XsEnNA1vfszQFE0sV2T2LiCxYCz9S6bE583/XzfJRG6oQrqSN/gCZD
         +/i97vYkLW5kLPqsePqODK0lyPfIF5WrnsBXbDGR74FNf1fTkXQUbRpOGnKlnFo8TxtD
         C71AhzkOSzoXXq14977F39EmjU4YvGcyWKruJSiAw/arld0RZY7NHV4NjJe/mFOL3Bwv
         lOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYdNI4v5CQNc5gig5WY0X7v3UyA16OmYYz8gUR5siyFTpNBoz+oHVYw52GTMc40YFP4zE2NdQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfq4B+bvxYTCFzCs4nMGaupkB1wcsB/B0IgJLkJbEFqmVJo3oM
	7am+dTLTCLo/5jnFCjwCOMZ6nGpac1CpxMFkN6Woewr3QoP9tT6Uy6D3
X-Gm-Gg: ASbGnctDG6J8HKVAoYuWzw86ougDyAn56k+aND9QHcIT7/Kiyw1OxdT/STQjT3si57N
	NSASvZICoLu3cupVaXTUtYNfpo1gT7ONm3LnHPA4AWjDJLkyzq/crJr5KM5Z1iFBr752jUzU0VF
	aNsCv++kpHgbH6MpQkqrRGhh4ljORCvIh8+M6r9U2a1cpusMnC6hxrScVbCC/anxwXRZr83mQ/K
	/DLXsDVEWTk19zvIpk/M0A03dgFNjsV7Or2ChQCHLFtboGs9H5n1QRfZW9dVbp6a9sBmPsZn8Ej
	7bj/Rx+o9xMu5ca9wy5DtrT/9EH91ztlv5iFzHPN/M3MwGbDEo1A4KniGeciYPtC7o9J2At38SV
	D4uNi//G7DxpXtThwW5AxrA==
X-Google-Smtp-Source: AGHT+IE3o1PVbYcGVOeDDd2u9PBkS7qnGIBAlmbvXpp/v9MUV/Gw0EgVgPEcUGAR3AbyDFV8S3qXgg==
X-Received: by 2002:a05:6a00:1708:b0:748:2cbb:be45 with SMTP id d2e1a72fcca58-74ee2160164mr15089737b3a.15.1752453894571;
        Sun, 13 Jul 2025 17:44:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9f8f35bsm9245897b3a.169.2025.07.13.17.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:44:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add ethernet GMAC device for sg2042
Date: Mon, 14 Jul 2025 08:44:34 +0800
Message-ID: <175245386393.141174.1523471014566184474.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250708064627.509363-1-inochiama@gmail.com>
References: <20250708064627.509363-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 08 Jul 2025 14:46:25 +0800, Inochi Amaoto wrote:
> Add ethernet GMAC device node for the sg2042.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: add ethernet GMAC device for sg2042
      https://github.com/sophgo/linux/commit/d099560dcbade90c9d508cb745faa786ae230d0b

Thanks,
Inochi

