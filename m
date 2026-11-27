Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745538;
	b=U1NnO4089iKuG/wC3ARlj/z21542V6aU7sFHGCr3VmZLiJzbsKoMD2S589I2GzBiv7YC
	 ikJmr4X63g/HbuouBVd2jKnpy43wZIal5nc2soJjv78VVcLdYIRmrPFqhyPLnS9nTSjbe
	 jgHaql4ijmhZnMj8CTCNLObtZFB1UECUVkPfLo5IFKrl2HO8FTR46aAtWmWkWoRm1hk3B
	 98x4V836how8AGSehzFVHJlamIW5Fm99WTH8D1EBNze8EBv0w2eH6MO/QS/uePcNdRwyq
	 rTsHioPzX9Vm/oLSJEDabtKaztE1U+k5zjxvS+uhirMo0a9Z3dt3nNPblj7mYIV+XOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745538;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iqETh/w29liZyZxnYaHCkgwbxAMco/TS5+4IZ81y538=;
	b=5Vjax41IUiAeObDzMtCizvomdsdEWEbYsqfVRqEaiZECTk6BCvewXr6xWn50q9dBNblY
	 rx27P8p+Vk9mB9lBI9KPwbLZo22w+LM9v2Tdd1awkI9D0AIsPBRa6h9mcu4CSTnzKY9gs
	 NKGC9HMVUs/Hf/xabKsEEappXB4Ti4DMcp2d4V+z5SyyxE9NrbIxPffyzKeeMMehmM892
	 ZTsZ7y+Xj4z84cUpPiosYtwODIDMapUidil2036R8NAqaZ7VkSmF++/EtPCxtYvtCChVn
	 /b6U4ykS5rdmyE3E3kvWjH0Jjz+5WzUSO1uZz4ABTSMY32b1zT0qViXsK1I7RsmAETg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vDz7UDDM;
	arc=none smtp.remote-ip=95.215.58.59
Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48A606A31C
	for <sophgo@lists.linux.dev>; Fri, 27 Nov 2026 02:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF48A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vDz7UDDM
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=azFRKdKdKq6gCBJRxN+6pHinoJrAR/Gn02Z7Jhd6DEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795745535; v=1; x=1796350335;
 b=vDz7UDDMSXEYGkblnctelilh2OMaoreCOr2/8HuYN7nT1y7v5qFV4q4ntlBPbySsp75bw7Ge
 06PvIyKUS7MV9bctQ3Nn3x/j2ew7h8MscQsUmCsNykmlC2H85S2A1ebo+CKhU8X9WoLShDAvyU0
 J72FguLR/x8K54DvOOKbb6eo=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7b71dec5d4732a7c;
	Fri, 27 Nov 2026 02:12:15 +0000
X-Mizu-Trace-ID: 7b71dec5d4732a7c
X-Migadu-Flow: FLOW_OUT
Message-ID: <b2e96d61-c4e8-4758-9178-bd37ac8a3e3c@linux.dev>
Date: Fri, 27 Nov 2026 10:12:05 +0800
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nvmem: Add Sophgo SG2044 eFuse driver
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <gaohan@iscas.ac.cn>,
 Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
 <20261124072924.556678-3-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261124072924.556678-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/24/2026 3:29 PM, Inochi Amaoto wrote:
> Sophgo SoCs such as SG2044 contain eFuses used to store
> factory-programmed data.
>
> As for SG2044, HW automatically loads the eFuse content
> into shadow registers which are organized as 32bit values
> exposed as MMIO.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <chen.wang@linux.dev>
> ---
>   drivers/nvmem/Kconfig        |  12 +++
>   drivers/nvmem/Makefile       |   2 +
>   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
>   3 files changed, 190 insertions(+)
>   create mode 100644 drivers/nvmem/sophgo-efuse.c
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb236663..3bcbad51616c 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -476,6 +476,18 @@ config NVMEM_SNVS_LPGPR
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-snvs-lpgpr.
>   
> +config NVMEM_SOPHGO_EFUSE
> +	tristate "Sophgo eFuse support"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	default ARCH_SOPHGO
> +	help
> +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> +	  such as the SG2044. These are e.g. used to store factory programmed
> +	  required data for internal device like ROM patch.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called nvmem-sophgo-efuse.
> +
>   config NVMEM_SPMI_SDAM
>   	tristate "SPMI SDAM Support"
>   	depends on SPMI
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5e70bad9f0f9..aac736057201 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -81,6 +81,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
>   nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
>   obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
>   nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
> +obj-$(CONFIG_NVMEM_SOPHGO_EFUSE)	+= nvmem-sophgo-efuse.o
> +nvmem-sophgo-efuse-y			:= sophgo-efuse.o
>   obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
>   nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
>   obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> new file mode 100644
> index 000000000000..d42f18f36828
> --- /dev/null
> +++ b/drivers/nvmem/sophgo-efuse.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Sophgo SoC eFuse driver
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/cleanup.h>
> +#include <linux/iopoll.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define SG2044_EFUSE_CONTENT_SIZE		0x400
> +
> +#define SG2044_EFUSE_MD				0x000
> +#define SG2044_EFUSE_ADR			0x004
> +#define SG2044_EFUSE_RD_DATA			0x00c
> +
> +#define SG2044_EFUSE_MODE			GENMASK(1, 0)
> +#define SG2044_EFUSE_MODE_READ			2
> +
> +#define SG2044_EFUSE_BOOT_DONE			BIT(7)
> +#define SG2044_BOOT_TIMEOUT			10000
> +
> +#define SG2044_EFUSE_ADR_ADDR			GENMASK(7, 0)
> +
> +#define SG2044_EFUSE_ALIGN			4
> +
> +struct sophgo_efuses {
> +	void __iomem *base;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct mutex mutex;
> +};
> +
> +static int sg2044_efuse_wait_mode(struct sophgo_efuses *efuse)
> +{
> +	u32 value;
> +
> +	return readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
> +				  FIELD_GET(SG2044_EFUSE_MODE, value) == 0,
> +				  1, SG2044_BOOT_TIMEOUT);
> +}
> +
> +static int sg2044_efuse_set_mode(struct sophgo_efuses *efuse, int mode)
> +{
> +	u32 val = readl(efuse->base + SG2044_EFUSE_MD);
> +
> +	val &= ~SG2044_EFUSE_MODE;
> +	val |= FIELD_PREP(SG2044_EFUSE_MODE, mode);
> +
> +	writel(val, efuse->base + SG2044_EFUSE_MD);
> +
> +	return sg2044_efuse_wait_mode(efuse);
> +}
> +
> +static int sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
> +				    unsigned int offset, u32 *strip)
> +{
> +	u32 val = FIELD_PREP(SG2044_EFUSE_ADR_ADDR, offset);
> +	int ret;
> +
> +	guard(mutex)(&efuse->mutex);
> +
> +	writel(val, efuse->base + SG2044_EFUSE_ADR);
> +
> +	ret = sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
> +	if (ret < 0)
> +		return ret;
> +
> +	*strip = readl(efuse->base + SG2044_EFUSE_RD_DATA);
> +
> +	return 0;
> +}
> +
> +static int sg2044_efuses_read(void *context, unsigned int offset, void *val,
> +			      size_t bytes)
> +{
> +	struct sophgo_efuses *efuse = context;
> +	unsigned int start, start_offset, end, i;
> +	u32 value;
> +	u8 *buf;
> +	int ret;
> +
> +	start = rounddown(offset, SG2044_EFUSE_ALIGN);
> +	end = roundup(offset + bytes, SG2044_EFUSE_ALIGN);
> +	start_offset = offset - start;
> +
> +	start /= SG2044_EFUSE_ALIGN;
> +	end /= SG2044_EFUSE_ALIGN;
> +
> +	ret = readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
> +				 (value & SG2044_EFUSE_BOOT_DONE),
> +				 1, SG2044_BOOT_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf = kzalloc((end - start) * SG2044_EFUSE_ALIGN, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	for (i = start; i < end; i++) {
> +		ret = sg2044_efuses_read_strip(efuse, i, &value);
> +		if (ret)
> +			goto failed;
> +
> +		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);
> +	}
> +
> +	memcpy(val, buf + start_offset, bytes);
> +
> +failed:
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
> +static int sophgo_efuses_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sophgo_efuses *efuse;
> +	struct nvmem_config config = {
> +		.dev = &pdev->dev,
> +		.add_legacy_fixed_of_cells = true,
> +		.read_only = true,
> +		.reg_read = sg2044_efuses_read,
> +		.stride = 1,
> +		.word_size = 1,
> +		.name = "sophgo-efuse",
> +		.id = NVMEM_DEVID_AUTO,
> +		.root_only = true,
> +	};
> +
> +	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
> +	if (!efuse)
> +		return -ENOMEM;
> +
> +	efuse->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(efuse->base))
> +		return PTR_ERR(efuse->base);
> +
> +	efuse->num_clks = devm_clk_bulk_get_all_enabled(&pdev->dev, &efuse->clks);
> +	if (efuse->num_clks < 0)
> +		return dev_err_probe(dev, efuse->num_clks, "failed to get clocks\n");
> +
> +	mutex_init(&efuse->mutex);
> +
> +	config.priv = efuse;
> +	config.size = SG2044_EFUSE_CONTENT_SIZE;
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
> +}
> +
> +static const struct of_device_id sophgo_efuses_of_match[] = {
> +	{ .compatible = "sophgo,sg2044-efuse" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> +
> +static struct platform_driver sophgo_efuses_driver = {
> +	.driver = {
> +		.name = "sophgo_efuse",
> +		.of_match_table = sophgo_efuses_of_match,
> +	},
> +	.probe = sophgo_efuses_probe,
> +};
> +module_platform_driver(sophgo_efuses_driver);
> +
> +MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
> +MODULE_DESCRIPTION("Sophgo efuse driver");
> +MODULE_LICENSE("GPL");
