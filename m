Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41336402A
	for <sophgo@lists.linux.dev>; Fri,  9 Oct 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539255; cv=none; b=fWV0KX20i26xdn2L4fNLJQXt/M0kaCRRLBN0kMr+SdKMM0rlpi8focys7A1zxwqAXOwxavMOIirW1Av9s5PnnRi3ZblKD58bjMXlDB5fb4pPCj180pI4Wj3D7cYuBzWAP3vrgImqFAfZ1uBabcCUEn8YOQPKvA6IPxaGypdlDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539255; c=relaxed/simple;
	bh=s3u5T5breAgT2P8lcRxXYdcTlv5dNJi6cEZM9dWPzaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4babD68rBzUqS1DoneKagWNBXfHlYy7VpCYPo7EjcSGArdnM35fmU27M0mT/m4EJQQ9DahU22a2KJuvmu7Ic2GK68AsZAIFmr+vPBXsGr7wMS2D/hHzne5Gm1qKsmGczZ47PpRenGzt0vSZvtrZxNClxArBNhc9czYnT3cDtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHqrav8o; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHqrav8o"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d560775ca2so20031105ad.1
        for <sophgo@lists.linux.dev>; Fri, 09 Oct 2026 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539253; x=1792144053; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=IHqrav8ozb/FElIFCyvvLSKMgbDgcRFGHgP3tJvBUWlXwAhVkUP62DgOLTkAWShUQl
         q0IbcWMMw2ENZzyfDXZ6NNDH86bQm8mBwVVuUa+U/SJCsHZOZ22EM7jSp7ACvlLv+tBi
         gz0Vj8xzBKtZkOWaaw5MeMFXveaP1IblkLq0OJRoIxJmvYlYGDPpDEqXgJ1HCbA9Xb4G
         xuKePf6CSmyZtCU16Xvrkk0BlZ98l2FFRkMUkzJ9SClYqlXIZv/GzQjOhfW6WtO5AMjD
         Py219uEBdStYaUMA32nWNrlNAKeCfGL4T3qA3OXWsDE+BIOuF2t2hVB21sCevEFGfsLD
         Uj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539253; x=1792144053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=t+R4qwUNlLWR2lZrL7fkaKj3npuTb+T+PFi3O6+7sVY2bnAyYylszkPgHixQFc+21+
         nnH4iXDVySWgk6kGVLD/B5i00YWvzYHFiq8J5UmspXgjC1TnU46wgbjwDp6dfTWM6J9Y
         4LD1dwm4qzlmDefIkinKGdLPFe380XfDQeglk/HtQv8tSRt8iLrAsYEok4LndeXA7+7E
         3PioIPnIjFZvPnpuPoo09oZ2EBr3woQ+ob5bxGYHdO6mtez/GTTYb0jCtDlWd8UH1eE8
         8hp8rfe7I2Ao73lodaluN4P6VXG41Xaqdwr3Npc27S5m12Wcy4xmEB40sNJ3xvnhyqy+
         QHUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1Lnz1xney+S75XwYAIDgWziG65VCxzZ8oP0/dszFBRqQXij3NOWp2qNq1HcfaYwqt9zChzFo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJYrxeF1fIfiBAECRKmgCUxu5HY6vLxA1S2PFtaI4u4NBORYeCh
	X5omTB9ns1rAaCIL3f7+ZpIawYmdKpad8eYSnHVDZqjC0iO6Vi/T2muq
X-Gm-Gg: AYBFou0uICsZntPbRYW/oC4v2sy2KlZZriuMQ68UBKDn64AsmpL5i+3hQ4hHvwJ5Fw7
	1p4j8bvjtfaVLseKIIAqGYLXcQZ0mIXGvw+Qu5j4pqjHKTGeVZ0ZF8WidwH/sOR95GaFWOZ3qk5
	h1DZ6JPbOsOPw5AKvXCnMFnUnWGxgt72OFRK1AanWWJkd7GtCCnRWZuDPfb8e2lIPR3raybBKEC
	4jsODl4mEQyZ/c0D8lAtpi4O2j/hJQehepEsDjKPE/9E1HNGvdwjgNaMN4gBlJDlMnLBsU14pk+
	QEMvXCLi6yLxqdjOvZzMULgbLQQpN9E1s6luZ/qzghaO9xdqaj9Rk2t562wK7gE6qnUvdKlKj8S
	Sf6+y337KQXbJquA9W1tIolybUFkgJyl5xpJZ05gzlBqY4eUXZP/bm1Ex8yM7LbTSGkDvBcdMSa
	AA7MLEE90dyMQHoaoRVmAE1iG05LL/Gm2U7lDmvq7Q1pRFT9imoERH3/OgxjP/wkpGFZtX
X-Received: by 2002:a17:902:ec84:b0:2e5:d2db:bf57 with SMTP id d9443c01a7336-2e842d03028mr11541545ad.49.1791539253450;
        Fri, 09 Oct 2026 02:47:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm5963035ad.33.2026.10.09.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yao Zi <me@ziyao.cc>,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Fri,  9 Oct 2026 17:47:06 +0800
Message-ID: <179153921383.259252.13110307622319000120.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 17:08:58 +0200, Andrei Lalaev wrote:
> Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
> the end of RAM. It is not correct because:
>   - FSBL can be configured to load FW into a different region
>   - if no firmware is loaded, the reserved memory is wasted
> 
> As explained in [1, 2], FSBL should reserve the region at runtime.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      https://github.com/sophgo/linux/commit/6645398c46219e97fd153ae6188ae86c493d2d6a
[2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node
      https://github.com/sophgo/linux/commit/60e4cafd30908e7d8cdfdb4fa1a74dabed9f47b5

Thanks,
Inochi

