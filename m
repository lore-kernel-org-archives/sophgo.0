Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200279;
	b=oRv0EDzOR7YGXtpg/xnDfn6Q+vYDOci07Fsm2H2NAddsStLW5iAzkX0s/J7V/mNCveA+
	 xx5CjWsCLkLcVSrmR8vE1FSFc4ncxJHhjTWVmGkdvobGrzYxvaIq71JB5GW0qCG8fEf1S
	 l5SAcTMpgTfPu0c9RVfiHk7CqosExFeKLG4GE0s8Pp3qeiAgudPWHtPcZ5XE38+cP0657
	 AE4BXe63/EyPtwf0Wjoh//T+30Q4bjYpdQ6ZgpQ3ncqHTKYy77+q0o467U8hCvKqdXsD1
	 jF4qYi9zb56XVSlGf8cdGSbh/e2V7jsVLnayCmag0sMFJS+2GPHbT0inc+65TyDM/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dbpUNDPZHadAmYIMfmFFaoO28ERPlPd7k31Pt+FAz5o=;
	b=NiiBKD6/sbUXPSOKSSyNHsWgCV2LockWAVWitdFsrcl6H7xc5SD+IfDOxhLrxSsC7Pzp
	 fNB/gORa9m0zecfa8uPiQPpmbzJHYk0eVfBEGQ14oNZVC/SjxJBXZN2BDd/40l1gEeD10
	 NGKS9Bchf3tg53ZO0t/VAVvtMWke28pibEc+k8y7vhRRaMkUIiakFYxTkOll2ZbQ5va72
	 8uUfPXXYFrLph11ObsWuXM7XvuCskVUOvbyfwMbMZ6zGVPHZbSFX94HuBMXVLLAaG72Mj
	 YkcfCJ/Xr4OCahd8a1AJJutJc3x3oMhrlXj7JjJpclb4EkDYOEuYogeRY7LUZwLMEJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RW35N9UV;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314460A261E
	for <sophgo@lists.linux.dev>; Fri, 20 Nov 2026 18:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A314460A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RW35N9UV
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so698008f8f.0
        for <sophgo@lists.linux.dev>; Fri, 20 Nov 2026 10:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795200277; x=1795805077; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dbpUNDPZHadAmYIMfmFFaoO28ERPlPd7k31Pt+FAz5o=;
        b=RW35N9UVpDU0dvSo7y1DxCVNrcZecRPVfFSlDoW2TafSgL39W5Q6HCEWYUNCvqWxxr
         HCl7pLpHe+bSSa7rY1nBl6kJhbBNms/ehKAhB0wGjaprwgWbXi0b6VZuqEyiWptcgpZJ
         RqKHY3ELuloSrYjO021TsYi2bR41/8OrhFPUwomaep5uZNP+ga1yiNp2xhW/kkmbseyX
         GLLUqk2HQv7NRmJyYSf7DzCTMOc1uPif24oNS67D6oBGrVqVYop9DYwg/+u3ny3PS/Kf
         yDroboptAOp9StMNNh4pXxFQufIbpcaaIgz65mrdhb+IuOYukduLWVVrAOQ3cV88i+Rt
         8N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200277; x=1795805077;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbpUNDPZHadAmYIMfmFFaoO28ERPlPd7k31Pt+FAz5o=;
        b=XVRpow7deeURXTDMgt/gevcTcta4m8Tczc42ErhLksqp5PIR4ZH1+cQQt8InOZ+0S3
         iwZQ+fXwKDkgAc4GY9/Jmd4jHwoMYUnXzfoTilVqE+dtofXKu41OuD2YCjmjPYYRAGaj
         VKU8MOxcWYi90S5rH18rGVeZaudBZXZi2QUZALzPT19H7O5AJBhHiFCtg8K/SU0e3TaU
         9Sj5gopMpekNwD7SwqWJU89mZGikJQQ4nKUm9eT344AbogGWQ//g1bcR6XPVkwaSYtm5
         9KFdodi15nTVjG3ehPl6V4l1cdjEQ8xDvc8prVFxIIPqbnIznbTTLFNbaPb2pjCayaKO
         2LGg==
X-Forwarded-Encrypted: i=1; AL+hErE0+gYIM92pyVnOoEVp+3203kb1GLnvO+2lp6HUMyuvyYiHxtChj1AKY/O6LDUfigg8ea6DPMY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9vtbQhIkKtOyqelnJhG4OoBFj2vgFLIeAlcB4yv7vGxdvuBNLp
	8yZcG5JVIpnUVHx6Xbcu74pUcscYzoQsUM0F1rZHupWAtbrCY8H8lygynOYEVXn+f0g=
X-Gm-Gg: AZFdTZdCQaesErvE0kT78VwQUfBIBmwQNxlwEkfjYXsS3z8RVH4hdPSm526p0dUShj/
	ZyVXI0aS3nJNam8fSAaRTP6V9dZPjxnCQBMbDRR13cwf+Ebamv/wDUGWwS5PL6U2zPeQ6Mf5YRO
	+W9hRxLzSyaYHWHYYCiEszAVAL+BBVgZEbsUAR39FtNBmXaW8Gk0234LBBgh8Dlj1a8+tBpJ5qm
	zJg2JPxrcF55fxltuJDIEUE43I4UIu7wRSFwoyBRl9dYch0ORI4bppWsbLhBH4j+SuO38tE31G/
	EHylsU0CWRwLmjpJB+mLfsrEx8VoYTdZqSpljT9pONOUHSkgGqn/uzEyafm3gZ9mAdH/sPYiw8P
	ep/+XWRZAHMPdsma1BDxqqpJBnSBUrrCYi+DNAXa10lfJZrU2o1pl/HlZvNsHnalchmhrSCRutX
	85MGADEtIHI0jRSV1OUr3FnM1md6Hhbuf06xIDuFHsurMAovV8JiwaV0F3yKvUBB0Iq0KUhghxe
	il23o9JvOfEBZmCWZl0dmLq7wbqLTW4EVTeL4fqJIs3dZI8A9cP7NfENPTBvNtn/V/PCVE1HpN1
	PxTW+vRa/wkygdyi8njKm8xe9mDRN4QIhlVUAUaNL1B5+Vf+
X-Received: by 2002:a5d:6691:0:b0:4a6:c3f:9d0e with SMTP id ffacd0b85a97d-4abb3d2c0bemr5838892f8f.44.1795200277031;
        Fri, 20 Nov 2026 10:44:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm7999128f8f.24.2026.11.20.10.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:44:36 -0800 (PST)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: sophgo: cv1800: set mux parent in
 bypass_mux_set_parent()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Phuong Nguyen <ndp2809@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org, 
 sophgo@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261120105737.7461-1-ndp2809@gmail.com>
References: <20261120105737.7461-1-ndp2809@gmail.com>
Date: Fri, 20 Nov 2026 19:44:34 +0100
Message-Id: <179520027402.3795820.10625849754833863467.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=542; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=eYRKSzuppIIPsVALhR3By5BFF1H2aR0BnquIko5QzAY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMU4U3Hp2+zfeUxPVfFT9DCubkvvgZvIoneHLQgoWVu
 9MLbXf5dpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAi9tEMv5i1dNcrNVy+u1qq
 vWDC77kxUnMSZvdd5HG59dyL59s9ZmaGv/IBl2sXVJ+ttOPb7Xv00dqkq+duOxQnJ3WrhvhMqc3
 p4QIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Fri, 20 Nov 2026 17:57:33 +0700, Phuong Nguyen <ndp2809@gmail.com> wrote:
> In bypass_mux_set_parent(), when index > 0, clearing the bypass bit
> switches the clock to the mux path without updating the mux selector.
> As a result, the hardware mux remains at parent 0 instead of selecting
> the requested parent.
> 
> Call mux_set_parent(hw, index - 1) before clearing the bypass bit to
> configure the mux selector before switching to the mux path.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

